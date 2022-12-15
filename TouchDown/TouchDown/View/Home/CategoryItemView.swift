//
//  CategoryItemView.swift
//  TouchDown
//
//  Created by yeonBlue on 2022/12/15.
//

import SwiftUI

struct CategoryItemView: View {
    
    // MARK: - Properties
    let category: CategoryModel
    
    // MARK: - Body
    var body: some View {
        Button {
            
        } label: {
            HStack(alignment: .center, spacing: 8) {
                Image(category.image)
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30, alignment: .center)
                    .foregroundColor(.gray)
                
                Text(category.name.uppercased())
                    .fontWeight(.light)
                    .foregroundColor(.gray)
                
                Spacer() // LaztHGrid 내에서 모든 셀이 고정 크기 유지 위함
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(.gray, lineWidth: 1)
            )
        }

    }
}

// MARK: - Preview
struct CategoryItemView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItemView(category: categories[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
