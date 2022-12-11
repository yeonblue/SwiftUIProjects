//
//  CoverImageView.swift
//  Africa
//
//  Created by yeonBlue on 2022/12/11.
//

import SwiftUI

struct CoverImageView: View {
    
    // MARK: - Properties
    let coverImageModelData = Bundle.main.decode("covers.json")
    
    // MARK: - Body
    var body: some View {
        TabView {
            ForEach(coverImageModelData) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(.page)
    }
}

// MARK: - Preview
struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
