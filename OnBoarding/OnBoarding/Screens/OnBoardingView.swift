//
//  OnBoardingView.swift
//  OnBoarding
//
//  Created by yeonBlue on 2022/12/05.
//

import SwiftUI

struct OnBoardingView: View {
    
    // MARK: - Properties
    @AppStorage("onBoarding") var isOnboardingViewActive = true
    @State private var buttonWidth = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0.0
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Color("MainBlue")
                .ignoresSafeArea(.all, edges: .all)
            
            VStack(spacing: 10) {
                
                // MARK: - Header
                Spacer()
                VStack(spacing: 0) {
                    Text("Share")
                        .font(.system(size: 60, weight: .heavy))
                        .foregroundColor(.white)
                    
                    Text("""
                         Want to share your applications with friends?
                         Share your application with Share
                         """)
                        .font(.title3)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(16)
                }
                
                // MARK: - Center
                ZStack {
                    CircleGroupView(shapeColor: .white, shapeOpacity: 0.2)
                    
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                }
                
                Spacer()
                
                // MARK: - Footer
                ZStack {
                    
                    // TODO: - Add Button
                    
                    Text("Get Started")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(x: 16)
                    
                    Capsule()
                        .fill(.white.opacity(0.2))
                    
                    Capsule()
                        .fill(.white.opacity(0.2))
                        .padding(8)
                    
                    HStack {
                        Capsule()
                            .fill(Color("MainRed"))
                            .frame(width: buttonOffset + 80)
                        
                        Spacer()
                    }
                    
                    HStack {
                        ZStack {
                            Circle()
                                .fill(Color("MainRed"))
                            
                            Circle()
                                .fill(.black.opacity(0.1))
                                .padding()
                            
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                        }
                        .foregroundColor(.white)
                        .frame(width: 80, height: 80, alignment: .center)
                        .offset(x: buttonOffset)
                        .gesture(
                            DragGesture()
                                .onChanged({ gesture in
                                    if gesture.translation.width > 0
                                    && buttonOffset <= buttonWidth - 80 { // 오른쪽으로 이동할 경우
                                        buttonOffset = gesture.translation.width
                                    }
                                })
                                .onEnded({ _ in
                                    if buttonOffset > buttonWidth / 2 {
                                        buttonOffset = buttonOffset - 80
                                        isOnboardingViewActive = false
                                    } else {
                                        buttonOffset = 0
                                    }
                                })
                        )
                        
                        Spacer()
                    }
                }
                .frame(width: buttonWidth, height: 80)
                .padding()
            }
        }
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
