//
//  Constants.swift
//  Devote
//
//  Created by yeonBlue on 2022/12/17.
//

import SwiftUI

// MARK: - Formatter
let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

// MARK: - UI
var backgroundGradient: LinearGradient {
    return LinearGradient(colors: [.pink, .blue],
                          startPoint: .topLeading,
                          endPoint: .bottomTrailing)
}

// MARK: - UX
