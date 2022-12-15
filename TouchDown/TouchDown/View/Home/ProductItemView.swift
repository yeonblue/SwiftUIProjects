//
//  ProductItemView.swift
//  TouchDown
//
//  Created by yeonBlue on 2022/12/15.
//

import SwiftUI

struct ProductItemView: View {
    
    // MARK: - Properties
    let product: ProductModel
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            // Photo
            ZStack {
                Image(product.image)
                    .resizable()
                    .scaledToFit()
                    .padding(10)
            }
            .background(product.rgbColor)
            .cornerRadius(12)
            
            // Name
            Text(product.name)
                .font(.title3)
                .fontWeight(.black)
            
            // Price
            Text(product.formattedPrice)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
        }
    }
}

// MARK: - Preview
struct ProductItemView_Previews: PreviewProvider {
    static var previews: some View {
        ProductItemView(product: products[0])
            .previewLayout(.fixed(width: 200, height: 300))
            .padding()
            .background(Color.colorBackground)
    }
}
