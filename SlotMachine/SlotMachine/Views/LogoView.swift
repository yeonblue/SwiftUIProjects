//
//  LogoView.swift
//  SlotMachine
//
//  Created by yeonBlue on 2022/12/23.
//

import SwiftUI

struct LogoView: View {
    
    // MARK: - Body
    var body: some View {
        Image("gfx-slot-machine")
            .resizable()
            .scaledToFit()
            .frame(minWidth: 256, idealWidth: 300, maxWidth: 320,
                   minHeight: 112, idealHeight: 130, maxHeight: 140,
                   alignment: .center)
            .padding()
            .layoutPriority(1)
            .modifier(ShadowModifier())
    }
}

// MARK: - Preview
struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
    }
}
