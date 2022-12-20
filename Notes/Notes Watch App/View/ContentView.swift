//
//  ContentView.swift
//  Notes Watch App
//
//  Created by yeonBlue on 2022/12/18.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    @AppStorage("lineCount") var lineCount = 1
    @State private var notes: [Note] = []
    @State private var text: String = ""
    
    // MARK: - Functions
    func save() {
        do {
            let data = try JSONEncoder().encode(notes)
            let url = getDocumentDirectory().appendingPathComponent("notes")
            try data.write(to: url)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getDocumentDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
    func load() {
        DispatchQueue.main.async { // State를 onAppear에서 바로 변경하려면 다른 queue에서 진행해야 함
            do {
                let url = getDocumentDirectory().appendingPathComponent("notes")
                let data = try Data(contentsOf: url)
                
                notes = try JSONDecoder().decode([Note].self, from: data)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func deleteRow(offsets: IndexSet) {
        notes.remove(atOffsets: offsets)
        save()
    }
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            VStack {
                
                // watchOS에서는 반반 차지, OS별로 다르게 표시 주의, 따라서 fixedSize() 사용
                HStack(alignment: .center, spacing: 6) {
                    TextField("Add New Note", text: $text)
                    
                    Button {
                        guard text.isEmpty == false else { return }
                        
                        let note = Note(id: UUID(), text: text)
                        notes.append(note)
                        text = ""
                        
                        save()
                        
                    } label: {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 42, weight: .semibold))
                    }
                    .fixedSize()
                    .buttonStyle(.plain)
                    .foregroundColor(.accentColor)
                }
                
                Spacer()
                
                if !notes.isEmpty {
                    List {
                        ForEach(0..<notes.count, id: \.self) { idx in
                            NavigationLink {
                                DetailView(note: notes[idx], count: notes.count, index: idx)
                            } label: {
                                HStack {
                                    Capsule()
                                        .frame(width: 4)
                                        .foregroundColor(.accentColor)
                                    
                                    Text(notes[idx].text)
                                        .lineLimit(lineCount)
                                        .padding(.leading, 5)
                                }
                            }

                        }
                        .onDelete(perform: deleteRow)
                    }
                } else {
                    Spacer()
                    Image(systemName: "note.text")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.gray.opacity(0.3))
                        .padding(32)
                    Spacer()
                }
            }
            .navigationTitle("Notes")
            .onAppear(perform: load)
        }
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
