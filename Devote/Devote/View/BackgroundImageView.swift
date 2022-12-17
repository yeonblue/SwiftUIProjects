//
//  BackgroundImageView.swift
//  Devote
//
//  Created by yeonBlue on 2022/12/17.
//

import SwiftUI

struct BackgroundImageView: View {
    
    // MARK: - Properties
    
    // MARK: - Body
    var body: some View {
        Image("rocket")
            .antialiased(true)
            .resizable()
            .scaledToFill()
            .ignoresSafeArea(.all, edges: .all)
    }
}

// MARK: - Preview
struct BackgroundImageView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundImageView()
    }
}
