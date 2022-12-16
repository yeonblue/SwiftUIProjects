//
//  Constants.swift
//  TouchDown
//
//  Created by yeonBlue on 2022/12/14.
//

import SwiftUI

// MARK: - Data
let players: [PlayerModel] = Bundle.main.decode("player.json")
let categories: [CategoryModel] = Bundle.main.decode("category.json")
let products: [ProductModel] = Bundle.main.decode("product.json")
let brands: [BrandModel] = Bundle.main.decode("brand.json")
let sampleProduct: ProductModel = products[0]

// MARK: - Layout
let columnSpacing: CGFloat = 10
let rowSpacing: CGFloat = 10
var gridLayout: [GridItem] {
    return Array(repeating: .init(.flexible()), count: 2)
}

// MARK: - API
// MARK: - Font
// MARK: - Data
// MARK: - String

