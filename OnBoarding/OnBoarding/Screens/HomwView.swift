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
        
        VStack {
            
            // MARK: - Header
            Spacer()
            ZStack {
                CircleGroupView(shapeColor: .gray, shapeOpacity: 0.1)
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                .padding()
            }
            
            // MARK: - Center
            Text("Send your friends directly application installation file (APK) and link to the app's page on the play store Market. Using this application.")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            
            // MARK: - Footer
            // Asset의 Accent Color는 버튼 등의 default color
            Spacer()
            Button {
                isOnboardingViewActive = true
            } label: {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                Text("Restart") // HStack은 필요없음
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
                
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)

        }
    }
}

struct HomwView_Previews: PreviewProvider {
    static var previews: some View {
        HomwView()
    }
}
