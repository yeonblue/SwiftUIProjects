//
//  ContentView.swift
//  OnBoarding
//
//  Created by yeonBlue on 2022/12/05.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    /// 프로그램이 onBoarding 키 값을 못찾을 때, 처음 한 번만 true로 저장됨
    /// 만약 해당 키 값을 find했으면, value set 작업은 무시함
    @AppStorage("onBoarding") var isOnboardingViewActive = true
    
    // MARK: - Body
    var body: some View {
        VStack {
            if isOnboardingViewActive {
                OnBoardingView()
            } else {
                HomwView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
