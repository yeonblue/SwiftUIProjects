//
//  FactsView.swift
//  Avocados
//
//  Created by yeonBlue on 2022/12/22.
//

import SwiftUI

struct FactsView: View {
    
    // MARK: - Properties
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Text("LoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLorem")
                .padding(.leading, 55)
                .padding(.trailing, 10)
                .padding(.vertical, 4)
                .frame(width: 300, height: 134, alignment: .center)
                .background(
                    LinearGradient(colors: [Color("ColorGreenMedium"),
                                            Color("ColorGreenLight")],
                                   startPoint: .leading,
                                   endPoint: .trailing)
                )
                .cornerRadius(12)
                .lineLimit(6)
                .multilineTextAlignment(.leading)
                .font(.footnote)
                .foregroundColor(.white)
            
            Image("avocado-fact-2")
                .resizable()
                .frame(width: 66, height: 66, alignment: .center)
                .clipShape(Circle())
                .background(
                    Circle().stroke(.white, lineWidth: 10)
                )
                .background(
                    Circle().stroke(
                        LinearGradient(colors: [Color("ColorGreenMedium"),
                                                Color("ColorGreenLight")],
                                       startPoint: .trailing,
                                       endPoint: .leading)
                        ,lineWidth: 20)
                )
                .background(
                    Circle().stroke(Color("ColorAppearanceAdaptive"), lineWidth: 30)
                )
                .offset(x: -150)
        }
    }
}

// MARK: - Preview
struct FactsView_Previews: PreviewProvider {
    static var previews: some View {
        FactsView()
            .previewLayout(.fixed(width: 414, height: 220))
    }
}
