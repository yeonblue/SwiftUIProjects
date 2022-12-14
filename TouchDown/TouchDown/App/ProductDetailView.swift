//
//  ProductDetailView.swift
//  TouchDown
//
//  Created by yeonBlue on 2022/12/16.
//

import SwiftUI

struct ProductDetailView: View {
    
    // MARK: - Properties
    @EnvironmentObject var shop: Shop
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            // MARK: - Nav Bar
            NavigationBarDetailView()
                .padding(.horizontal)
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            
            
            // MARK: - Header
            HeaderDetailView()
                .padding(.horizontal)
                .padding(.top, 16)
            
            // MARK: - Top part
            TopPartDetailView()
                .padding(.horizontal)
                .zIndex(1) // z축이 위로오게 해서 그림이 위로 오게 수정
                
            // MARK: - Bottom part
            VStack(alignment: .center, spacing: 0) {
                
                RatingSizesDetailView()
                    .padding(.bottom, 16)
                
                // MARK: - Description
                ScrollView(.vertical, showsIndicators: false) {
                    Text(shop.selectedProduct?.description ?? sampleProduct.description)
                        .font(.system(.body, design: .rounded))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                }
                
                // MARK: - Qunatity & Favorite
                QuantityFavouriteDetailView()
                    .padding(.vertical, 16)
                
                
                // MARK: - Add to cart
                AddToCartDetailView()
                    .padding(.bottom, 32)
                
                Spacer()
            }
            .padding(.horizontal)
            .background(
                Color.white
                    .clipShape(CustomShape())
                    .padding(.top, -110)
            )
            .zIndex(0)
            
        }
        .ignoresSafeArea(.all, edges: .all)
        .background(shop.selectedProduct?.rgbColor ?? sampleProduct.rgbColor)
    }
}

// MARK: - Preview
struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView()
            .environmentObject(Shop())
            .previewLayout(.fixed(width: 375, height: 812))
    }
}
