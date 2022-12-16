//
//  TopPartDetailView.swift
//  TouchDown
//
//  Created by yeonBlue on 2022/12/16.
//

import SwiftUI

struct TopPartDetailView: View {
    
    // MARK: - Properties
    @State private var isAnimating = false
    let product: ProductModel
    
    // MARK: - Body
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            
            // Price
            VStack(alignment: .leading, spacing: 8) {
                Text("Price")
                    .fontWeight(.semibold)
                
                Text(product.formattedPrice)
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .scaleEffect(1.3, anchor: .leading) // 앞을 기준으로 scaleEffect
            }
            .offset(y: isAnimating ? -50 : -75)
            
            Spacer()
            
            // Photo
            Image(product.image)
                .resizable()
                .scaledToFit()
                .offset(y: isAnimating ? 0 : -35)
        }.onAppear {
            withAnimation(.easeOut(duration: 0.75)) {
                isAnimating.toggle()
            }
        }
    }
}

// MARK: - Preview
struct TopPartDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TopPartDetailView(product: sampleProduct)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
