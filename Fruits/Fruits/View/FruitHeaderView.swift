//
//  FruitHeaderView.swift
//  Fruits
//
//  Created by yeonBlue on 2022/12/09.
//

import SwiftUI

struct FruitHeaderView: View {
    
    // MARK: - Properties
    let fruit: FruitModel
    
    @State private var isAnimating = false
    
    // MARK: - Body
    var body: some View {
        ZStack {
            LinearGradient(colors: fruit.gradientColors,
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            
            Image(fruit.image)
                .resizable()
                .scaledToFit()
                .shadow(color: .black.opacity(0.2), radius: 8, x: 4, y: 4)
                .padding(.vertical, 20)
                .scaleEffect(isAnimating ? 1 : 0.6)
        }
        .frame(height: 440)
        .onAppear {
            withAnimation(.easeOut(duration: 0.5)) {
                isAnimating = true
            }
        }
    }
}

// MARK: - Preview
struct FruitHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        FruitHeaderView(fruit: fruitsData[0])
            .previewLayout(.fixed(width: 375, height: 440))
    }
}
