//
//  FruitCardView.swift
//  Fruits
//
//  Created by yeonBlue on 2022/12/08.
//

import SwiftUI

struct FruitCardView: View {
    
    // MARK: - Properties
    @State private var isAnimating = false
    
    // MARK: - Body
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                
                // Image
                Image("blueberry")
                    .resizable()
                    .scaledToFit()
                    .shadow(color: .black.opacity(0.2), radius: 8, x: 8, y: 8)
                    .scaleEffect(isAnimating ? 1.0 : 0.6)
                
                // Title
                Text("Blueberry")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .shadow(color: .black.opacity(0.2), radius: 2, x: 2, y: 2)
                
                // Headline
                Text("Blueberries are swwet, and wildly popular fruit all over the world.")
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 16)
                    .frame(maxWidth: 480) // 보통 가로로 80자를 넘기는 것은 좋지 않음
                
                // Button
                StartButtonView()
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(
            LinearGradient(gradient: Gradient(colors: [Color("ColorBlueberryLight"),
                                                       Color("ColorBlueberryDark")]),
                           startPoint: .top,
                           endPoint: .bottom)
        )
        .cornerRadius(20)
        .padding(8)
        .onAppear {
            withAnimation(.easeOut(duration: 0.5)) {
                isAnimating = true
            }
        }
    }
}

// MARK: - Preview
struct FruitCardView_Previews: PreviewProvider {
    static var previews: some View {
        FruitCardView()
            .previewLayout(.fixed(width: 320, height: 640))
    }
}
