//
//  ContentView.swift
//  Devote
//
//  Created by yeonBlue on 2022/12/16.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    // MARK: - Properties
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    @State private var showNewTaskItemView = false
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {

                    Spacer(minLength: 80)
                    
                    Button {
                        showNewTaskItemView = true
                    } label: {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 30, weight: .semibold, design: .rounded))
                        Text("New Task")
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                    }
                    .foregroundColor(.white)
                    .padding(16)
                    .background(
                        LinearGradient(colors: [.pink, .blue],
                                       startPoint: .leading,
                                       endPoint: .trailing)
                        .clipShape(Capsule())
                    )
                    .shadow(color: .black.opacity(0.3), radius: 8)

                    
                    List {
                        ForEach(items) { item in
                            VStack(alignment: .leading) {
                                Text(item.task ?? "")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                
                                Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                            }
                            .padding(4)
                        }
                        .onDelete(perform: deleteItems)
                    }
                    .listStyle(.insetGrouped)
                    .scrollContentBackground(.hidden)
                    .shadow(color: .black.opacity(0.3), radius: 16)
                    .padding(.vertical, 0)
                    .frame(maxWidth: 640)
                }
                
                if showNewTaskItemView {
                    BlankView()
                        .onTapGesture {
                            withAnimation {
                                showNewTaskItemView = false
                            }
                        }
                    NewTaskItemView(isShowing: $showNewTaskItemView)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                
                // ToolbarItem(placement: .navigationBarTrailing) {
                //     Button(action: addItem) {
                //         Label("Add Item", systemImage: "plus")
                //     }
                // }
            }
            .navigationTitle("Daily Tasks")
            .navigationBarTitleDisplayMode(.large)
            .background(BackgroundImageView())
            .background(backgroundGradient)
        }
    }

    // MARK: - Functions
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
