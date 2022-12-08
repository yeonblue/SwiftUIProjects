//
//  FruitModel.swift
//  Fruits
//
//  Created by yeonBlue on 2022/12/08.
//

import SwiftUI

// MARK: - FruitModel
struct FruitModel: Identifiable {
    let id = UUID()
    
    var title: String
    var headline: String
    var image: String
    var gradientColors: [Color]
    var description: String
    var nutrition: [String]
}
