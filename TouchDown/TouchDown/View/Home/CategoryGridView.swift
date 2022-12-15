//
//  CategoryGridView.swift
//  TouchDown
//
//  Created by yeonBlue on 2022/12/15.
//

import SwiftUI

struct CategoryGridView: View {
    
    // MARK: - Properties
    
    // MARK: - Body
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: gridLayout, alignment: .center, spacing: columnSpacing) {
                
                Section(content: {
                    ForEach(categories) { item in
                        CategoryItemView(category: item)
                    }
                }, header: {
                    SectionView(rotateClockwise: false)
                }, footer: {
                    SectionView(rotateClockwise: true)
                })
            }
            .frame(height: 140)
            .padding(8)
        }
    }
}

// MARK: - Preview
struct CategoryGridView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryGridView()
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.colorBackground)
    }
}
