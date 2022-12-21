//
//  CardView.swift
//  LearnByDoing
//
//  Created by yeonBlue on 2022/12/21.
//

import SwiftUI

struct CardView: View {
    
    // MARK: - Properties
    @State private var fadeIn: Bool = false
    @State private var moveDown: Bool = false
    @State private var moveUp: Bool = false
    var card: CardModel
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Image(card.imageName)
                .opacity(fadeIn ? 1.0 : 0.0)
            
            VStack {
                Text(card.title)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                
                Text(card.headline)
                    .foregroundColor(.white)
                    .italic()
            }
            .offset(y: moveDown ? -218 : -300)
            
            Button {
                playSound(sound: "sound-chime", type: "mp3")
            } label: {
                HStack(spacing: 8) {
                    Text(card.callToAction.uppercased())
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .tint(.white)
                    Image(systemName: "arrow.right.circle")
                        .font(.title)
                        .fontWeight(.medium)
                        .tint(.white)
                }
                .padding(.vertical)
                .padding(.horizontal, 24)
                .background(
                    LinearGradient(colors: card.gradientColors, startPoint: .leading, endPoint: .trailing)
                )
                .clipShape(Capsule())
                .shadow(color: Color("colorShadow"), radius: 8)
            }
            .offset(y: moveUp ? 210 : 300)
        }
        .frame(width: 335, height: 545)
        .background(LinearGradient(colors: card.gradientColors, startPoint: .top, endPoint: .bottom))
        .cornerRadius(16)
        .shadow(radius: 8)
        .onAppear {
            withAnimation(.linear(duration: 1.3)) {
                self.fadeIn.toggle()
            }
            
            withAnimation(.linear(duration: 0.8)) {
                self.moveDown.toggle()
                self.moveUp.toggle()
            }
        }
    }
}

// MARK: - Preview
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: cardData.randomElement()!)
            .previewLayout(.sizeThatFits)
    }
}
