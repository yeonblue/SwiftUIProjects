//
//  Modifier.swift
//  SlotMachine
//
//  Created by yeonBlue on 2022/12/23.
//

import SwiftUI

struct ShadowModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .colorTransparentBlack, radius: 8, x: 0, y: 6)
    }
}

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .tint(.white)
    }
}

struct ScoreNumberShadowModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .colorTransparentBlack, radius: 4)
            .layoutPriority(1)        
    }
}

struct ScoreContainerModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.vertical, 8)
            .padding(.horizontal, 16)
            .frame(minWidth: 128)
            .background(
                Capsule()
                    .fill(Color.colorTransparentBlack)
            )
    }
}

struct BetNumberModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(.title, design: .rounded))
            .padding(.vertical, 8)
            .frame(width: 90)
            .shadow(color: .colorTransparentBlack, radius: 4)
    }
}

struct BetCapsuleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(
                Capsule()
                    .fill(
                        LinearGradient(colors: [.colorPink, .colorPurple],
                                       startPoint: .top,
                                       endPoint: .bottom)
                    )
                    .modifier(ShadowModifier())
            )
            .padding(3)
            .background(
                Capsule()
                    .stroke(LinearGradient(colors: [.colorPink, .colorPurple],
                                           startPoint: .bottom,
                                           endPoint: .top),
                            lineWidth: 3)
            )
    }
}

struct CasinoChipsModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(height: 64)
            .modifier(ShadowModifier())
    }
}
