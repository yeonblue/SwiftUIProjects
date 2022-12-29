//
//  CardTransition.swift
//  Honeymoon
//
//  Created by yeonBlue on 2022/12/29.
//

import SwiftUI

extension AnyTransition {
    static var leadingBottom: AnyTransition {
        AnyTransition.asymmetric(insertion: .identity,
                                 removal: .move(edge: .leading).combined(with: .move(edge: .bottom)))
    }
    
    static var trailingBottom: AnyTransition {
        AnyTransition.asymmetric(insertion: .identity,
                                 removal: .move(edge: .trailing).combined(with: .move(edge: .bottom)))
    }
}
