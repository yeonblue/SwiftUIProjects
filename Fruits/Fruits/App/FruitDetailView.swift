//
//  FruitDetailView.swift
//  Fruits
//
//  Created by yeonBlue on 2022/12/09.
//

import SwiftUI

struct FruitDetailView: View {

    // MARK: - Properties
    var fruit: FruitModel
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center, spacing: 20) {
                    
                    // Header
                    FruitHeaderView(fruit: fruit)
                    
                    // MARK: - Header
                    VStack(alignment: .leading, spacing: 20) {
                                            
                        // Title
                        Text(fruit.title)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(fruit.gradientColors.last!)
                        
                        // Headline
                        Text(fruit.headline)
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                        
                        // Nutrients
                        FruitNutrientsView(fruit: fruit)
                        
                        // Sub-headline
                        Text("Learn more about \(fruit.title)".uppercased())
                            .fontWeight(.bold)
                            .foregroundColor(fruit.gradientColors.last!)
                        
                        // Description
                        Text(fruit.description)
                            .multilineTextAlignment(.leading)
                        
                        // Link
                        SourceLinkView()
                            .padding(.top, 8)
                            .padding(.bottom, 40)
                    }
                    .padding(.horizontal, 20)
                    .frame(maxWidth: 640, alignment: .center)
                }
            }
            .toolbar(.hidden) // navigationBarhidden 대신 사용
            .edgesIgnoringSafeArea(.top)
        }
        .navigationViewStyle(.stack) // iPad에서 split으로 안보이게 하기 위함
    }
}

// MARK: - Preview
struct FruitDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FruitDetailView(fruit: fruitsData[0])
    }
}
