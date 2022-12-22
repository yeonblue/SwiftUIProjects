//
//  FactModel.swift
//  Avocados
//
//  Created by yeonBlue on 2022/12/22.
//

import Foundation

struct Fact: Identifiable {
    let id = UUID()
    var image: String
    var content: String
}
