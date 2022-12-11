//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by yeonBlue on 2022/12/11.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> [T] {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) in bundle")
        }
        
        let decoder = JSONDecoder()
        guard let coverImageModelData = try? decoder.decode([T].self, from: data) else {
            fatalError("Failed to decode")
        }
        
        return coverImageModelData
    }
}
