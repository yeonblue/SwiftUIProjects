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
    @State private var isAnimating = false
    
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
                    .offset(y: isAnimating ? 35 : -35)
                    .animation(.easeOut(duration: 3).repeatForever(), value: isAnimating)
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
                withAnimation {
                    playSound(sound: "success", type: "m4a")
                    isOnboardingViewActive = true
                }
            } label: {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                Text("Restart") // HStack은 필요없음
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
                
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)

        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                isAnimating = true
            })
        }
    }
}

struct HomwView_Previews: PreviewProvider {
    static var previews: some View {
        HomwView()
    }
}
