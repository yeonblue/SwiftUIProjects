//
//  CreditsView.swift
//  Notes Watch App
//
//  Created by yeonBlue on 2022/12/20.
//

import SwiftUI

struct CreditsView: View {
    
    // MARK: - Properties
    @State private var randomNumber: Int = Int.random(in: 1..<4)
    private var randomImage: String {
        return "developer-no\(randomNumber)"
    }
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 4) {
            
            // Profile Image
            Image(randomImage)
                .resizable()
                .scaledToFit()
                .layoutPriority(1)
            
            // Header
            HeaderView(title: "Credits")
            
            // Content
            Text("SY")
                .foregroundColor(.primary)
                .fontWeight(.bold)
            
            Text("Developer")
                .font(.footnote)
                .foregroundColor(.secondary)
                .fontWeight(.light)
        }
    }
}

// MARK: - Preview
struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
