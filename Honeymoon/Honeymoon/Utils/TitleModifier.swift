//
//  TitleModifier.swift
//  Honeymoon
//
//  Created by yeonBlue on 2022/12/29.
//

import SwiftUI

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.pink)
    }
}
