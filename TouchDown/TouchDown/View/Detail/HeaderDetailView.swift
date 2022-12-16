//
//  HeaderDetailView.swift
//  TouchDown
//
//  Created by yeonBlue on 2022/12/16.
//

import SwiftUI

struct HeaderDetailView: View {
    
    // MARK: - Properties
    let product: ProductModel
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Protective Gear")
            Text(product.name)
                .font(.largeTitle)
                .fontWeight(.black)
        }
        .foregroundColor(.white)
    }
}

// MARK: - Preview
struct HeaderDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderDetailView(product: sampleProduct)
            .previewLayout(.sizeThatFits)
            .padding()
            .background(.gray)
    }
}
