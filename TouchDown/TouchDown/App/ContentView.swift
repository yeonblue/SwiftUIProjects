//
//  ContentView.swift
//  TouchDown
//
//  Created by yeonBlue on 2022/12/14.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties

    // MARK: - Body
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                NavigationBarView()
                    .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                    .background(.white)
                    .shadow(color: .black.opacity(0.5), radius: 5, x: 0, y: 5)

                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 4) {
                        
                        FeaturedTabView()
                            .frame(height: UIScreen.main.bounds.width / 1.475) 
                            .padding(.vertical, 20)
                        
                        CategoryGridView()
                        
                        LazyVGrid(columns: gridLayout, spacing: 16) {
                            ForEach(products) { item in
                                ProductItemView(product: item)
                            }
                        }
                        .padding(16)
                        
                        TitleView(title: "Helmet")
                        FooterView()
                            .padding(.horizontal)
                    }
                }
            }
            .background(Color.colorBackground.ignoresSafeArea(.all, edges: .all))
        }
        .ignoresSafeArea(.all, edges: .top)
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
