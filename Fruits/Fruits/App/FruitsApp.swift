//
//  FruitsApp.swift
//  Fruits
//
//  Created by yeonBlue on 2022/12/08.
//

import SwiftUI

@main
struct FruitsApp: App {
    
    @AppStorage("isOnboarding") var isOnboarding = true // 맨 처음 실행 시는 반드시 onboarding을 보여줌
    
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                OnboardingView()
            } else {
                ContentView()
            }
        }
    }
}

/// App -> Scenes -> Views
///    1: n.            1:n
/// iPadOS는 여러 window를 가질 수 있음
/// iOS, tvOS, watchOS는 single full screen window를 가짐
