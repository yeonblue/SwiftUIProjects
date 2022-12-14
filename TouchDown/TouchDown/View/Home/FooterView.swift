//
//  FooterView.swift
//  TouchDown
//
//  Created by yeonBlue on 2022/12/14.
//

import SwiftUI

struct FooterView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text("We offer the most cutting edge, comfortable, lightweight and dural football helmets in the market at affordable prices")
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
            
            Image("logo-lineal")
                .renderingMode(.template)
                .foregroundColor(.gray)
            
            Text("Copyright @ SY\nAll right reserved")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
            
        }
    }
}

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView()
            .previewLayout(.sizeThatFits)
            .background(Color.colorBackground)
    }
}
