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
    @State private var showingSettingsView = false
    
    @State private var animatingButton = false
    
    // Theme
    @AppStorage("themeSettings") var themeSettings: Int = 0
    let themes: [Theme] = themeDatas
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            ZStack {
                List {
                    ForEach(todos, id: \.self) { item in
                        HStack {
                            Circle()
                                .frame(width: 12, height: 12)
                                .foregroundColor(colorrize(priority: item.priority ?? "Normal"))
                            Text(item.name ?? "Unknown")
                                .fontWeight(.semibold)
                            Spacer()
                            Text(item.priority ?? "Unknown")
                                .font(.footnote)
                                .padding(4)
                                .frame(minWidth: 64)
                                .overlay {
                                    Capsule()
                                        .stroke(Color(UIColor.systemGray2), lineWidth: 1)
                                }
                        }
                        .padding(8)
                    }
                    .onDelete(perform: deleteTodo)
                }
                .navigationTitle("Todo")
                .navigationBarTitleDisplayMode(.inline)
                .listStyle(.grouped)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                            .tint(themes[themeSettings].themeColor)
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            self.showingSettingsView.toggle()
                        } label: {
                            Image(systemName: "paintbrush")
                        }
                        .tint(themes[themeSettings].themeColor)
                        
                    }
                }
                
                if todos.isEmpty {
                    EmptyListView()
                }
            }
            .sheet(isPresented: $showingAddTodoView) {
                AddTodoView()
            }
            .sheet(isPresented: $showingSettingsView) {
                SettingsView()
            }
            .overlay(alignment: .bottomTrailing) {
                
                // MARK: - Overlay Buttons
                ZStack {
                    Group {
                        Circle()
                            .fill(themes[themeSettings].themeColor)
                            .opacity(animatingButton ? 0.2 : 0)
                            .scaleEffect(animatingButton ? 1 : 0)
                            .frame(width: 68, height: 68, alignment: .center)
                        
                        Circle()
                            .fill(themes[themeSettings].themeColor)
                            .opacity(animatingButton ? 0.15 : 0)
                            .scaleEffect(animatingButton ? 1 : 0)
                            .frame(width: 88, height: 88, alignment: .center)
                    }
                    .animation(.easeOut(duration: 2).repeatForever(autoreverses: true),
                               value: animatingButton)
                    
                    Button {
                        self.showingAddTodoView.toggle()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .background(Circle().fill(Color("ColorBase")))
                            .frame(width: 48, height: 48, alignment: .center)
                    }
                    .tint(themes[themeSettings].themeColor)
                    .onAppear {
                        self.animatingButton.toggle()
                    }
                }
                .padding([.bottom, .trailing], 16)
            }
        }
    }

    // MARK: - Functions
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
    
    private func colorrize(priority: String) -> Color {
        switch priority {
            case "High":
                return .pink
            case "Normal":
                return .green
            case "Low":
                return .blue
            default:
                return .gray
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
            .environment(\.managedObjectContext,
                          PersistenceController.preview.container.viewContext)
    }
}
