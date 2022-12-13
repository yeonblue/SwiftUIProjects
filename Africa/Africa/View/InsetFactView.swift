//
//  InsetFactView.swift
//  Africa
//
//  Created by yeonBlue on 2022/12/13.
//

import SwiftUI

struct InsetFactView: View {
    
    // MARK: - Properties
    let animal: AnimalModel
    
    // MARK: - Body
    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact, id: \.self) { item in
                    Text(item)
                }
            }
            .tabViewStyle(.page)
            .frame(minWidth: 148, idealHeight: 168, maxHeight: 180)
        }
    }
}

// MARK: - Preview
struct InsetFactView_Previews: PreviewProvider {
    static let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    static var previews: some View {
        InsetFactView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
