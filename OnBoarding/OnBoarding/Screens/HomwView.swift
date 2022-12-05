//
//  HomwView.swift
//  OnBoarding
//
//  Created by yeonBlue on 2022/12/05.
//

import SwiftUI

struct HomwView: View {
    
    // MARK: - Properties
    @AppStorage("onBoarding") var isOnboardingViewActive = false
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 20) {
            Text("Home")
                .font(.largeTitle)
        }
        
        Button {
          isOnboardingViewActive = true
        } label: {
            Text("Restart")
        }

    }
}

struct HomwView_Previews: PreviewProvider {
    static var previews: some View {
        HomwView()
    }
}
