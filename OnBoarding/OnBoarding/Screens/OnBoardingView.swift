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
    @State private var buttonOffset: CGFloat = 0.0
    @State private var isAnimating = false
    @State private var imageOffset: CGSize = .zero
    @State private var indicatorOpacity: Double = 1.0
    @State private var textTitle = "Share"
    
    let hapticFeedBack = UINotificationFeedbackGenerator() // 진동(햅틱센서), 아이폰에서만 가능, 아이패드 불가
    private var buttonWidth = UIScreen.main.bounds.width - 80
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Color("MainBlue")
                .ignoresSafeArea(.all, edges: .all)
            
            VStack(spacing: 10) {
                
                // MARK: - Header
                Spacer()
                VStack(spacing: 0) {
                    Text(textTitle)
                        .font(.system(size: 60, weight: .heavy))
                        .foregroundColor(.white)
                        .transition(.opacity)
                        .id(textTitle) // !! textTitle이 바뀜으로써 TextView가 바뀌었음을 전달
                    
                    Text("""
                         Want to share your applications with friends?
                         Share your application with Share
                         """)
                        .font(.title3)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(16)
                }
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : -40)
                .animation(.easeOut(duration: 1.0), value: isAnimating)
                
                // MARK: - Center
                ZStack {
                    CircleGroupView(shapeColor: .white, shapeOpacity: 0.2)
                        .offset(x: imageOffset.width * -1) // 이미지와 반대로 이동
                        .blur(radius: abs(imageOffset.width / 5)) // 양수로만 넘겨야 함(가우시안 참고)
                        .animation(.easeOut(duration: 1), value: imageOffset)
                    
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        .opacity(isAnimating ? 1: 0)
                        .animation(.easeOut(duration: 1), value: isAnimating)
                        .offset(x: imageOffset.width, y: 0)
                        .rotationEffect(.degrees(Double(imageOffset.width / 20)))
                        .gesture(
                            DragGesture()
                                .onChanged({ gesture in
                                    
                                    if abs(imageOffset.width) <= 150 {
                                        imageOffset = gesture.translation
                                        textTitle = "Give"
                                    }
                                    
                                    withAnimation {
                                        indicatorOpacity = 0
                                    }
                                })
                                .onEnded({ _ in
                                    imageOffset = .zero
                                    
                                    withAnimation {
                                        indicatorOpacity = 1
                                        textTitle = "Share"
                                    }
                                })
                        )
                        .animation(.easeOut(duration: 1), value: imageOffset)
                }
                .overlay(alignment: .bottom, content: {
                    Image(systemName: "arrow.left.and.right.circle")
                        .font(.system(size: 40, weight: .ultraLight))
                        .foregroundColor(.white)
                        .offset(y: 20)
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.easeOut(duration: 1), value: isAnimating)
                        .opacity(indicatorOpacity)
                })
                
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
                                .onEnded { _ in
                                    withAnimation(.easeOut(duration: 0.3)) {
                                        if buttonOffset > buttonWidth / 2 {
                                            
                                            playSound(sound: "chimeup", type: "mp3")
                                            hapticFeedBack.notificationOccurred(.success)
                                            buttonOffset = buttonOffset - 80
                                            isOnboardingViewActive = false
                                        } else {
                                            buttonOffset = 0
                                            hapticFeedBack.notificationOccurred(.warning)
                                        }
                                    }
                                }
                        )
                        
                        Spacer()
                    }
                }
                .frame(width: buttonWidth, height: 80)
                .padding()
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : 40)
                .animation(.easeOut(duration: 1), value: isAnimating)
            }
        }
        .onAppear {
            isAnimating = true
        }
        .preferredColorScheme(.dark)
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
