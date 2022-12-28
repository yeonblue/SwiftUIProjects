//
//  GuideComponent.swift
//  Honeymoon
//
//  Created by yeonBlue on 2022/12/28.
//

import SwiftUI

struct GuideComponent: View {
    
    // MARK: - Properties
    var title: String
    var subtitle: String
    var description: String
    var icon: String
    
    // MARK: - Body
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            Image(systemName: icon)
                .font(.largeTitle)
                .foregroundColor(.pink)
            
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(title.uppercased())
                        .font(.title)
                        .fontWeight(.heavy)
                    Spacer()
                    Text(subtitle.uppercased())
                        .font(.footnote)
                        .fontWeight(.heavy)
                        .foregroundColor(.pink)
                }
                
                Divider().padding(.bottom, 4)
                
                Text(description)
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            .fixedSize(horizontal: false, vertical: true) // 표시될수 있는 ideal Size로 고정
        }
    }
}

// MARK: - Preview
struct GuideComponent_Previews: PreviewProvider {
    static var previews: some View {
        GuideComponent(title: "Title",
                       subtitle: "subtitle",
                       description: "placeholder description placeholder description placeholder description placeholder description",
                       icon: "heart.circle")
            .previewLayout(.sizeThatFits)
    }
}
