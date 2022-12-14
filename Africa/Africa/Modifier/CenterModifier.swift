//
//  CenterModifier.swift
//  Africa
//
//  Created by yeonBlue on 2022/12/14.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
