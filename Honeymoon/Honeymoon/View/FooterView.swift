//
//  FooterView.swift
//  Honeymoon
//
//  Created by yeonBlue on 2022/12/28.
//

import SwiftUI

struct FooterView: View {
    
    // MARK: - Properties
    
    // MARK: - Body
    var body: some View {
        HStack {
            Image(systemName: "xmark.circle")
                .font(.system(size: 42, weight: .light))
                
            Spacer()
            Button {
                
            } label: {
                Text("Book Destination".uppercased())
                    .font(.system(.subheadline, design: .rounded))
                    .fontWeight(.heavy)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 24)
                    .foregroundColor(.pink)
                    .background {
                        Capsule()
                            .stroke(.pink, lineWidth: 2)
                    }
            }

            Spacer()
            
            Image(systemName: "heart.circle")
                .font(.system(size: 42, weight: .light))
        }
        .padding()
    }
}

// MARK: - Preview
struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView()
            .previewLayout(.fixed(width: 375, height: 80))
    }
}
