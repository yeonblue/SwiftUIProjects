//
//  SettingsRowView.swift
//  Fruits
//
//  Created by yeonBlue on 2022/12/10.
//

import SwiftUI

struct SettingsRowView: View {
    
    // MARK: - Properties
    var title: String
    var contentStr: String? = nil
    var linkLabelStr: String? = nil
    var linkDestination: String? = nil
    
    // MARK: - Body
    var body: some View {
        VStack {
            Divider().padding(.vertical, 4)
            HStack {
                Text(title)
                    .foregroundColor(.gray)
                Spacer()
                if let contentStr = contentStr {
                    Text(contentStr)
                } else if let linkLabelStr = linkLabelStr,
                          let linkDestination = linkDestination {
                    Link(linkLabelStr, destination: URL(string: "https://\(linkDestination)")!)
                    Image(systemName: "arrow.up.right.square").foregroundColor(.pink)
                } else {
                    EmptyView()
                }
            }
        }
    }
}

// MARK: - Preview
struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SettingsRowView(title: "Developer", contentStr: "SY")
                .previewLayout(.fixed(width: 375, height: 60))
                .padding()
            
            SettingsRowView(title: "Website",
                            linkLabelStr: "GitHub",
                            linkDestination: "github.com/yeonblue/SwiftUIProjects/tree/main/Fruits")
                .previewLayout(.fixed(width: 375, height: 60))
                .padding()
        }
    }
}
