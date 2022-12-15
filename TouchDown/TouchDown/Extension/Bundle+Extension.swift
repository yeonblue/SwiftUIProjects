//
//  Bundle+Extension.swift
//  TouchDown
//
//  Created by yeonBlue on 2022/12/15.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to search file : \(file)")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load file : \(file)")
        }
        
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode file : \(file)")
        }
        
        return decodedData
    }
}
