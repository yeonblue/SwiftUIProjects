//
//  CreditsView.swift
//  Africa
//
//  Created by yeonBlue on 2022/12/14.
//

import SwiftUI

struct CreditsView: View {
    
    // MARK: - Properties
    
    // MARK: - Body
    var body: some View {
        VStack {
            
            Image("compass")
                .resizable()
                .scaledToFit()

                .frame(width: 128, height: 128)
            Text(
                """
                Copyright @ SY
                All right reserved
                SwiftUI Practice App
                """
            )
            .font(.footnote)
            .multilineTextAlignment(.center)
        }
        .padding()
        .opacity(0.5)
    }
}

// MARK: - Preview
struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .previewLayout(.sizeThatFits)
    }
}
