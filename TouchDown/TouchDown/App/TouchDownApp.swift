//
//  TouchDownApp.swift
//  TouchDown
//
//  Created by yeonBlue on 2022/12/14.
//

import SwiftUI

@main
struct TouchDownApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Shop())
        }
    }
}
