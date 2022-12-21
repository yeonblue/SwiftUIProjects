//
//  CardView.swift
//  LearnByDoing
//
//  Created by yeonBlue on 2022/12/21.
//

import SwiftUI

struct CardView: View {
    
    // MARK: - Properties
    var gradient: [Color] = [Color("Color01"), Color("Color02")]
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Image("developer-no1")
            
            VStack {
                Text("SwiftUI")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                
                Text("Better apps. Less code")
                    .foregroundColor(.white)
                    .italic()
            }
            .offset(y: -218)
            
            Button {
                
            } label: {
                HStack(spacing: 8) {
                    Text("Learn".uppercased())
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
                    LinearGradient(colors: gradient, startPoint: .leading, endPoint: .trailing)
                )
                .clipShape(Capsule())
                .shadow(color: Color("colorShadow"), radius: 8)
            }
            .offset(y: 210)
        }
        .frame(width: 335, height: 545)
        .background(LinearGradient(colors: gradient, startPoint: .top, endPoint: .bottom))
        .cornerRadius(16)
        .shadow(radius: 8)
    }
}

// MARK: - Preview
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
            .previewLayout(.sizeThatFits)
    }
}
