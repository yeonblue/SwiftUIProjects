//
//  FeaturedTabView.swift
//  TouchDown
//
//  Created by yeonBlue on 2022/12/15.
//

import SwiftUI

struct FeaturedTabView: View {
    
    // MARK: - Properties
    
    // MARK: - Body
    var body: some View {
        TabView {
            ForEach(players) { player in
                FeaturedItemView(player: player)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
    }
}

// MARK: - Preview
struct FeaturedTabView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedTabView()
            .previewLayout(.sizeThatFits)
    }
}
