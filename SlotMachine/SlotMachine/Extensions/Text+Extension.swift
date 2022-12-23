//
//  Text+Extension.swift
//  SlotMachine
//
//  Created by yeonBlue on 2022/12/23.
//

import SwiftUI

extension Text {
    func scoreLabelStyle() -> Text {
        self
            .foregroundColor(.white)
            .font(.system(size: 10, weight: .bold, design: .rounded))
    }
    
    func scoreNumberStyle() -> Text {
        self
            .foregroundColor(.white)
            .font(.system(.title, design: .rounded))
            .fontWeight(.heavy)
    }
    
    func scoreNumberShadowStyle() -> some View {
        self.modifier(ScoreNumberShadowModifier())
    }
    
    func betNumberModifier() -> some View {
        self.modifier(BetNumberModifier())
    }
}
