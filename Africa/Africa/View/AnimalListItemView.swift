//
//  AnimalListItemView.swift
//  Africa
//
//  Created by yeonBlue on 2022/12/11.
//

import SwiftUI

struct AnimalListItemView: View {
    
    // MARK: - Properties
    let animal: AnimalModel
    
    // MARK: - Body
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            Image(animal.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            VStack(alignment: .leading, spacing: 8) {
                Text(animal.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                
                Text(animal.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2...3)
            }
        }
    }
}

// MARK: - Preview
struct AnimalListItemView_Previews: PreviewProvider {
    static let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    static var previews: some View {
        AnimalListItemView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
