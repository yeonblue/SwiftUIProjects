//
//  ReelView.swift
//  SlotMachine
//
//  Created by yeonBlue on 2022/12/23.
//

import SwiftUI

struct ReelView: View {
    
    // MARK: - Properties
    
    // MARK: - Body
    var body: some View {
        Image("gfx-reel")
            .reelImageModifier()
    }
}

// MARK: - Preview
struct ReelView_Previews: PreviewProvider {
    static var previews: some View {
        ReelView()
            .previewLayout(.fixed(width: 220, height: 220))
    }
}
