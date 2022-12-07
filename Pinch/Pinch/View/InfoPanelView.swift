//
//  InfoPanelView.swift
//  Pinch
//
//  Created by yeonBlue on 2022/12/07.
//

import SwiftUI

struct InfoPanelView: View {
    
    // MARK: - Properties
    var scale: CGFloat
    var offset: CGSize
    
    @State private var isInfoPanelVisible = false
    
    // MARK: - Body
    var body: some View {
        HStack {
            
            // MARK: - Symbol
            Image(systemName: "circle.circle")
                .symbolRenderingMode(.hierarchical) // image 렌더링모드 - 템플릿, 오리지널과 별도로 sfsymbol 전용 모드, 멀티컬러 등 존재
                .resizable()
                .frame(width: 30, height: 30)
                .onLongPressGesture(minimumDuration: 1) {
                    isInfoPanelVisible.toggle()
                }
            
            Spacer()
            
            // MARK: - Info Panel
            HStack {
                Image(systemName: "arrow.up.left.and.arrow.down.right")
                Text("\(scale)")
                
                Spacer()
                
                Image(systemName: "arrow.up.and.down")
                Text("\(offset.width)")
                
                Spacer()
                
                Image(systemName: "arrow.left.and.right")
                Text("\(offset.height)")
                
                Spacer()
            }
            .font(.footnote)
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(8)
            .frame(maxWidth: 420)
            .opacity(isInfoPanelVisible ? 1 : 0)
            
            Spacer()
        }
    }
}

struct InfoPanelView_Previews: PreviewProvider {
    static var previews: some View {
        InfoPanelView(scale: 1, offset: .zero)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
            .padding()
    }
}
