//
//  StartButtonView.swift
//  Fruits
//
//  Created by yeonBlue on 2022/12/08.
//

import SwiftUI

struct StartButtonView: View {
    
    // MARK: - Propeties
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    
    // MARK: - Body
    var body: some View {
        
        Button {
            isOnboarding = false
        } label: {
            HStack(spacing: 8) {
                Text("Start")
                Image(systemName: "arrow.right.circle")
                    .imageScale(.large)
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background(
            Capsule().strokeBorder(.white, lineWidth: 1)
        )
        .tint(.white)
    }
}

// MARK: - Preview
struct StartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        StartButtonView()
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
