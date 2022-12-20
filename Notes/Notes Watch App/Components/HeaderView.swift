//
//  HeaderView.swift
//  Notes Watch App
//
//  Created by yeonBlue on 2022/12/20.
//

import SwiftUI

struct HeaderView: View {
    
    // MARK: - Properties
    var title: String = ""
    
    // MARK: - Body
    var body: some View {
        
        VStack {
            // Title
            if !title.isEmpty {
                Text(title.uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.accentColor)
            }
            
            // Seperator
            HStack {
                Capsule()
                    .frame(height: 1)
                Image(systemName: "note.text")
                Capsule()
                    .frame(height: 1)
            }
            .foregroundColor(.accentColor)
        }
    }
}

// MARK: - Preview
struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HeaderView()
            HeaderView(title: "Title")
        }
    }
}
