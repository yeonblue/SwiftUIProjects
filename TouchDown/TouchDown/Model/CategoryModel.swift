//
//  CategoryModel.swift
//  TouchDown
//
//  Created by yeonBlue on 2022/12/15.
//

import Foundation

struct CategoryModel: Codable, Identifiable {
    let id: Int
    let name: String
    let image: String
}
