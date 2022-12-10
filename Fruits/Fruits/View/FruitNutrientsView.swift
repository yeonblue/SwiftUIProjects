//
//  FruitNutrientsView.swift
//  Fruits
//
//  Created by yeonBlue on 2022/12/10.
//

import SwiftUI

struct FruitNutrientsView: View {
    
    // MARK: - Properties
    var fruit: FruitModel
    let nutrients: [String] = [
        "Energy",
        "Sugar",
        "Fat",
        "Protein",
        "Vitamins",
        "Minerals"
    ]
    
    // MARK: - Body
    var body: some View {
        GroupBox {
            DisclosureGroup("Nutritional value per 100g") {
                ForEach(0..<nutrients.count, id: \.self) { idx in
                    Divider()
                        .padding(.vertical, 2)
                    
                    HStack {
                        Group {
                            Image(systemName: "info.circle")
                            Text(nutrients[idx])
                        }
                        .foregroundColor(fruit.gradientColors.last!)
                        .font(.system(.body, weight: .bold))
                        
                        Spacer(minLength: 16)
                        
                        Text(fruit.nutrition[idx])
                            .multilineTextAlignment(.trailing)
                    }
                }
            }
        }
    }
}

// MARK: - Preview
struct FruitNutrientsView_Previews: PreviewProvider {
    static var previews: some View {
        FruitNutrientsView(fruit: fruitsData[0])
            .previewLayout(.fixed(width: 375, height: 480))
            .padding()
    }
}
