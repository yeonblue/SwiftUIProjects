//
//  VideoModel.swift
//  Africa
//
//  Created by yeonBlue on 2022/12/13.
//

import Foundation

struct VideoModel: Codable, Identifiable{
    let id: String
    let name: String
    let headline: String
    
    var thumbnail: String {
        return "video-\(id)"
    }
}
