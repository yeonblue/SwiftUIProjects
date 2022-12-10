//
//  SourceLinkView.swift
//  Fruits
//
//  Created by yeonBlue on 2022/12/09.
//

import SwiftUI

struct SourceLinkView: View {
 
    // MARK: - Properties
    
    // MARK: - Body
    var body: some View {
        GroupBox { // 일반 Text나 Label 요소를 그룹화하여 스타일링 해주는 컴포넌트, dark mode 알아서 지원
            HStack {
                Text("Content source")
                Spacer()
                Link("Wikipedia", destination: URL(string: "https://wikipedia.com")!)
                Image(systemName: "arrow.up.right.square")
            }
            .font(.footnote)
        }
    }
}

// MARK: - Preview
struct SourceLinkView_Previews: PreviewProvider {
    static var previews: some View {
        SourceLinkView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
