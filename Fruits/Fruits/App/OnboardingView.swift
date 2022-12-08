//
//  OnboardingView.swift
//  Fruits
//
//  Created by yeonBlue on 2022/12/08.
//

import SwiftUI

struct OnboardingView: View {
    
    // MARK: - Properties
    
    
    // MARK: - Body
    var body: some View {
        TabView {
            ForEach(0..<5) { item in
                FruitCardView()
            }
        }
        .tabViewStyle(.page)
        .padding(.vertical, 20)
    }
}

// MARK: - Preview
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
