//
//  SymbolModifier.swift
//  Honeymoon
//
//  Created by yeonBlue on 2022/12/29.
//

import SwiftUI

struct SymbolModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.system(size: 128))
            .shadow(color: .black.opacity(0.3), radius: 16)
    }
}
