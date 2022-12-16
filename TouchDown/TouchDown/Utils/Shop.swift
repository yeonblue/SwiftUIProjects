//
//  Shop.swift
//  TouchDown
//
//  Created by yeonBlue on 2022/12/16.
//

import Foundation

class Shop: ObservableObject {
    @Published var showingProduct: Bool = false
    @Published var selectedProduct: ProductModel? = nil
}
