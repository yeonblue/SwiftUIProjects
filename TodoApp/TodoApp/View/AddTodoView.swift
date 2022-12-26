//
//  AddTodoView.swift
//  TodoApp
//
//  Created by yeonBlue on 2022/12/26.
//

import SwiftUI

struct AddTodoView: View {
    
    // MARK: - Properties
    @Environment(\.dismiss) var dismiss
    
    @State private var name: String = ""
    @State private var priority: String = "Normal"
    
    let priorites = ["High", "Normal", "Low"]
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    TextField("Todo", text: $name)
                    
                    Picker("Priority", selection: $priority) {
                        ForEach(priorites, id: \.self) { item in
                            Text(item)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    Button {
                        
                    } label: {
                        Text("Save")
                    }
                }
                
                Spacer()
            }
            .navigationTitle("New Todo")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }

                }
            }
        }
    }
}

// MARK: - Preview
struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoView()
    }
}
