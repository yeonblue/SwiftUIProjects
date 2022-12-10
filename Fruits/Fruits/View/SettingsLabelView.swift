//
//  SettingsLabelView.swift
//  Fruits
//
//  Created by yeonBlue on 2022/12/10.
//

import SwiftUI

struct SettingsLabelView: View {
    
    // MARK: - Properties
    var labelText: String
    var imageName: String
    
    // MARK: - Body
    var body: some View {
        HStack {
            Text(labelText.uppercased())
                .fontWeight(.bold)
            Spacer()
            Image(systemName: imageName)
        }
    }
}

// MARK: - Preview
struct SettingsLabelView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsLabelView(labelText: "Fruits", imageName: "info.circle")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
