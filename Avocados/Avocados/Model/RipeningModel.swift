//
//  RipeningModel.swift
//  Avocados
//
//  Created by yeonBlue on 2022/12/23.
//

import SwiftUI

struct Ripening: Identifiable {
    let id = UUID()
    var image: String
    var stage: String
    var title: String
    var description: String
    var ripeness: String
    var instruction: String
}
