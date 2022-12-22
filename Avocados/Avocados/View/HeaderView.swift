//
//  HeaderView.swift
//  Avocados
//
//  Created by yeonBlue on 2022/12/22.
//

import SwiftUI

struct HeaderView: View {
    
    // MARK: - Properties
    @State private var showHeadline = false
    
    var slideInAnimation: Animation {
        .spring(response: 1.5, dampingFraction: 0.5, blendDuration: 0.5)
        .speed(1)
        .delay(0.25)
    }
    
    var header: Header
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Image(header.image)
                .resizable()
                .scaledToFill()
            
            HStack(alignment: .top) {
                
                Rectangle()
                    .fill(Color("ColorGreenLight"))
                    .frame(width: 4)
                
                VStack {
                    Text(header.headline)
                        .font(.system(.title, design: .serif))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .shadow(radius: 4)
                    
                    Text(header.subheadline)
                        .font(.footnote)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.white)
                        .shadow(radius: 4)
                }
                .padding(.horizontal, 20)
                .frame(width: 280, height: 100)
                .background(Color("ColorBlackTransparentLight"))
            }
            .frame(width: 285, height: 100, alignment: .center)
            .offset(x: -80, y: showHeadline ? 75 : 220)
            .animation(slideInAnimation, value: showHeadline)
            .onAppear {
                showHeadline.toggle()
            }
        }
        .frame(width: 480, height: 320, alignment: .center)
    }
}

// MARK: - Preview
struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(header: headersData.randomElement()!)
            .previewLayout(.sizeThatFits)
    }
}
