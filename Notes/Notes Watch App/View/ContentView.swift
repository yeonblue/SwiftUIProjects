//
//  ContentView.swift
//  Notes Watch App
//
//  Created by yeonBlue on 2022/12/18.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    @State private var notes: [Note] = []
    @State private var text: String = ""
    
    // MARK: - Functions
    func save() {
        guard text.isEmpty == false else { return }
        
        let note = Note(id: UUID(), text: text)
        notes.append(note)
        text = ""
    }
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            VStack {
                
                // watchOS에서는 반반 차지, OS별로 다르게 표시 주의, 따라서 fixedSize() 사용
                HStack(alignment: .center, spacing: 6) {
                    TextField("Add New Note", text: $text)
                    
                    Button {
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
                
                Text("\(notes.count)")
            }
            .navigationTitle("Notes")
        }
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
