//
//  TitleView.swift
//  TouchDown
//
//  Created by yeonBlue on 2022/12/15.
//

import SwiftUI

struct TitleView: View {
    
    // MARK: - Properties
    var title: String
    
    // MARK: - Body
    var body: some View {
        HStack {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.heavy)
            
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
    }
}

// MARK: - Preview
struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(title: "Helmet")
            .previewLayout(.sizeThatFits)
            .background(Color.colorBackground)
    }
}
