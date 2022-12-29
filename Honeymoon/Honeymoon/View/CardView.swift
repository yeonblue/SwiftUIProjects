//
//  CardView.swift
//  Honeymoon
//
//  Created by yeonBlue on 2022/12/28.
//

import SwiftUI

struct CardView: View, Identifiable {
    
    // MARK: - Properties
    let id = UUID()
    var honeymoon: Destination
    
    // MARK: - Body
    var body: some View {
        Image(honeymoon.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(32)
            .frame(minWidth: 0, maxWidth: .infinity)
            .overlay(alignment: .bottom) {
                VStack(alignment: .center, spacing: 12) {
                    Text(honeymoon.place.uppercased())
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .shadow(radius: 2)
                        .padding(.vertical, 4)
                        .padding(.horizontal, 16)
                        .underline()
                    
                    Text(honeymoon.country.uppercased())
                        .foregroundColor(.black)
                        .font(.footnote)
                        .fontWeight(.bold)
                        .frame(minWidth: 85)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 5)
                        .background {
                            Capsule()
                                .fill(.white)
                        }
                }
                .frame(minWidth: 200)
                .padding(.bottom, 50)
            }
    }
}

// MARK: - Preview
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(honeymoon: honeymoonDatas.randomElement()!)
            .previewLayout(.fixed(width: 375, height: 600))
    }
}
