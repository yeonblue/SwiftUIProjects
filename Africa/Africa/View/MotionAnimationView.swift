//
//  MotionAnimationView.swift
//  Africa
//
//  Created by yeonBlue on 2022/12/14.
//

import SwiftUI

struct MotionAnimationView: View {
    
    // MARK: - Properties
    @State private var randomCircle = Int.random(in: 8...16)
    @State private var isAnimating = false
    
    // MARK: - Body
    var body: some View {
        
        // Geometry로 감싸면 origin은 topLeft로 변경됨
        GeometryReader { geometry in
            ZStack {
                ForEach(0..<randomCircle, id: \.self) { item in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.2)
                        .frame(width: randomSize(), height: randomSize(), alignment: .center)
                        .scaleEffect(isAnimating ? randomScale() : 1)
                        .position(x: randomCordinate(max: geometry.size.width),
                                  y:randomCordinate(max: geometry.size.height))
                        .animation(.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                            .repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelay()),
                                   value: isAnimating
                        )
                }
            }
            .onAppear {
                isAnimating = true
            }
            
        }
        .drawingGroup() // 복잡한 렌더링 시 추가할 경우 앱 과부하 방지 가능, 비트맵으로 표시
    }
    
     // MARK: - Functions
    private func randomCordinate(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0..<max)
    }
    
    private func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 50..<250))
    }
    
    private func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1..<2.0))
    }
    
    private func randomSpeed() -> Double {
        return Double.random(in: 0.025...1.0)
    }
    
    private func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
}

// MARK: - Preview
struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}
