//
//  ContentView.swift
//  LearnByDoing
//
//  Created by yeonBlue on 2022/12/21.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    var cards: [CardModel] = cardData
    
    // MARK: - Body
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 16) {
                ForEach(cards) { data in
                    CardView(card: data)
                }
            }
        }
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
