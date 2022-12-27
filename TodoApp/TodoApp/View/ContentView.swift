//
//  ContentView.swift
//  TodoApp
//
//  Created by yeonBlue on 2022/12/26.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    // MARK: - Properties
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Todo.name, ascending: true)],
        animation: .default)
    private var todos: FetchedResults<Todo>

    @State private var showingAddTodoView = false
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(todos, id: \.self) { item in
                        HStack {
                            Text(item.name ?? "Unknown")
                            Spacer()
                            Text(item.priority ?? "Unknown")
                        }
                    }
                    .onDelete(perform: deleteTodo)
                }
                .navigationTitle("Todo")
                .navigationBarTitleDisplayMode(.inline)
                .listStyle(.grouped)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            self.showingAddTodoView.toggle()
                        } label: {
                            Image(systemName: "plus")
                        }
                        
                    }
                }
                .sheet(isPresented: $showingAddTodoView) {
                    AddTodoView()
                }
                
                if todos.isEmpty {
                    EmptyListView()
                }
            }
        }
    }

    // MARK: - Functions
    private func addTodo() {
        withAnimation {
            let newItem = Todo(context: viewContext)
            newItem.name = "Dummy Data"

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteTodo(offsets: IndexSet) {
        withAnimation {
            offsets.map { todos[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .environment(\.managedObjectContext,
                          PersistenceController.preview.container.viewContext)
    }
}
