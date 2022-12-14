//
//  GalleryView.swift
//  Africa
//
//  Created by yeonBlue on 2022/12/10.
//

import SwiftUI

struct GalleryView: View {
    
    // MARK: - Properties
    
    // MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Text("Gallery")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

// MARK: - Preview
struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
