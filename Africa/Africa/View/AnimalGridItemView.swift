//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by yeonBlue on 2022/12/14.
//

import SwiftUI

struct AnimalGridItemView: View {
    
    // MARK: - Propeties
    let animal: AnimalModel
    
    // MARK: - Body
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

// MARK: - Preview
struct AnimalGridItemView_Previews: PreviewProvider {
    static let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    static var previews: some View {
        AnimalGridItemView(animal: animals[0])
            .previewLayout(.sizeThatFits)
    }
}
