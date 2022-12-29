//
//  ButtonModifier.swift
//  Honeymoon
//
//  Created by yeonBlue on 2022/12/29.
//

import SwiftUI

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity)
            .foregroundColor(.white)
            .background {
                Capsule()
                    .fill(.pink)
            }
    }
}
