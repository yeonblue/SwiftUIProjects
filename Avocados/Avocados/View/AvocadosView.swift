//
//  AvocadosView.swift
//  Avocados
//
//  Created by yeonBlue on 2022/12/22.
//

import SwiftUI

struct AvocadosView: View {
    
    // MARK: - Properties
    @State private var pulseAnimation = false
    
    // MARK: - Body
    var body: some View {
        VStack {
            Spacer()
            Image("avocado")
                .resizable()
                .scaledToFit()
                .frame(width: 240, height: 240)
                .shadow(radius: 32)
                .scaleEffect(pulseAnimation ? 1 : 0.8)
                .opacity(pulseAnimation ? 1 : 0.8)
                .animation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: pulseAnimation)
            
            Text("Avocados".uppercased())
                .font(.system(size: 42, weight: .bold, design: .serif))
                .foregroundColor(.white)
                .padding()
                .shadow(radius: 4)
            
            Text("Creamy, green, and full of nutrients! Avocado is a powerhouse ingredient at any meal. Enjoy these handpicked avocado recipes for breakfast, lunch, dinner & more!")
                .lineLimit(nil)
                .font(.system(.headline, design: .serif))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .lineSpacing(8)
                .frame(maxWidth: 640, minHeight: 120)
                .padding(.horizontal, 16)
            
            
            Spacer()
        }
        .background(
            Image("background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea([.top, .leading, .trailing])
        )
        .onAppear {
            self.pulseAnimation.toggle()
        }
    }
}

// MARK: - Preview
struct AvocadosView_Previews: PreviewProvider {
    static var previews: some View {
        AvocadosView()
    }
}
