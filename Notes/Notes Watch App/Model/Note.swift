//
//  Note.swift
//  Notes Watch App
//
//  Created by yeonBlue on 2022/12/20.
//

import Foundation

struct Note: Codable, Identifiable {
    let id: UUID
    let text: String
}
