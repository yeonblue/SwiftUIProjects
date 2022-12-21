//
//  CardModel.swift
//  LearnByDoing
//
//  Created by yeonBlue on 2022/12/21.
//

import SwiftUI

struct CardModel: Identifiable {
    let id = UUID()
    var title: String
    var headline: String
    var imageName: String
    var callToAction: String
    var message: String
    var gradientColors: [Color]
}
