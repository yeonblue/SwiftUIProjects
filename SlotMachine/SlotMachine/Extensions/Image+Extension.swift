//
//  Image+Extension.swift
//  SlotMachine
//
//  Created by yeonBlue on 2022/12/23.
//

import SwiftUI

extension Image {
    func reelImageModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(minWidth: 140, idealWidth: 200, maxWidth: 220,
                   minHeight: 130, idealHeight: 190, maxHeight: 200,
                   alignment: .center)
            .modifier(ShadowModifier())
    }
}
