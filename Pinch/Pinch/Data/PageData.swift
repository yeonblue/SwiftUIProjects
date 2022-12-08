//
//  PageData.swift
//  Pinch
//
//  Created by yeonBlue on 2022/12/08.
//

import Foundation

let pagesData: [PageModel] = [
    PageModel(id: 1, imageName: "magazine-front-cover"),
    PageModel(id: 2, imageName: "magazine-back-cover")
]

extension PageModel {
    var thumbnailName: String {
        return "thumb-" + imageName
    }
}
