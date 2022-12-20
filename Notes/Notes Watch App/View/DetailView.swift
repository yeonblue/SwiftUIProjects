//
//  DetailView.swift
//  Notes Watch App
//
//  Created by yeonBlue on 2022/12/20.
//

import SwiftUI

struct DetailView: View {
    
    // MARK: - Properties
    let note: Note
    let count: Int
    let index: Int
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .center, spacing: 4) {
            
            // Header
            HStack {
                Capsule()
                    .frame(height: 1)
                Image(systemName: "note.text")
                Capsule()
                    .frame(height: 1)
            }
            .foregroundColor(.accentColor)
            
            // Content
            Spacer()
            ScrollView(.vertical) {
                Text(note.text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            }
            
            // Footer
            HStack(alignment: .center) {
                Image(systemName: "gear")
                    .imageScale(.large)
                Spacer()
                Text("\(count) / \(index + 1)")
                Spacer()
                Image(systemName: "info.circle")
            }
            .foregroundColor(.secondary)
        }
        .padding(4)
    }
}

// MARK: - Preview
struct DetailView_Previews: PreviewProvider {
    static var sampleData: Note = Note(id: UUID(), text: "Sample Data")
    static var previews: some View {
        DetailView(note: sampleData, count: 5, index: 1)
    }
}
