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
    
    @State private var isCreditsViewPresented = false
    @State private var isSettingsViewPresented = false
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .center, spacing: 4) {
            
            // Header
            HeaderView()
            
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
                    .onTapGesture {
                        isSettingsViewPresented.toggle()
                    }
                Spacer()
                Text("\(count) / \(index + 1)")
                Spacer()
                Image(systemName: "info.circle")
                    .onTapGesture {
                        isCreditsViewPresented.toggle()
                    }
            }
            .foregroundColor(.secondary)
            .sheet(isPresented: $isSettingsViewPresented) {
                SettingView()
            }
            .sheet(isPresented: $isCreditsViewPresented) {
                CreditsView() // watchOS에서는 Cancel버튼으로 뒤로 가기 가능
            }
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
