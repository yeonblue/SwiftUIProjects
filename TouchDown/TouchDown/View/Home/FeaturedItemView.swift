//
//  FeaturedItemView.swift
//  TouchDown
//
//  Created by yeonBlue on 2022/12/15.
//

import SwiftUI

struct FeaturedItemView: View {
    
    // MARK: - Properties
    let player: PlayerModel
    
    // MARK: - Body
    var body: some View {
        Image(player.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

// MARK: - Preview
struct FeaturedItemView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedItemView(player: players[0])
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.colorBackground)
    }
}
