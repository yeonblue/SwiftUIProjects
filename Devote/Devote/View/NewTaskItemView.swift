//
//  NewTaskItemView.swift
//  Devote
//
//  Created by yeonBlue on 2022/12/17.
//

import SwiftUI

struct NewTaskItemView: View {
    
    // MARK: - Properties
    @Environment(\.managedObjectContext) private var viewContext
    @State var task: String = ""
    @Binding var isShowing: Bool
    
    private var isButtonDisabled: Bool {
        return task.isEmpty
    }
    
    // MARK: - Functions
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.task = task
            newItem.completion = false
            newItem.id = UUID()

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
            
            task = ""
            hideKeyboard()
            isShowing = false
        }
    }
    
    // MARK: - Body
    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: 16) {
                TextField("New Task", text: $task)
                    .foregroundColor(.pink)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .padding()
                    .background(Color(UIColor.systemGray6)) // placeholder 색
                    .cornerRadius(8)
                
                Button {
                    addItem()
                } label: {
                    Spacer()
                    Text("Save")
                    Spacer()
                }
                .padding()
                .font(.headline)
                .foregroundColor(.white)
                .background(isButtonDisabled ? .blue : .pink)
                .cornerRadius(10)
                .disabled(isButtonDisabled)

            }
            .padding(.horizontal)
            .padding(.vertical, 20)
            .background(.white)
            .cornerRadius(16)
            .shadow(color: .black.opacity(0.6), radius: 24)
            .frame(maxWidth: 640)
        }
        .padding()
    }
}

// MARK: - Preview
struct NewTaskItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskItemView(isShowing: .constant(true))
            .background(Color.gray.edgesIgnoringSafeArea(.all))
    }
}
