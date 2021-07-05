//
//  Level.swift
//  Project
//
//  Created by Denis Kravets on 29.06.2021.
//

import Foundation

struct Level: Codable {
    let rate: Int
    let result: String
    
    func getResult() -> String {
        return "Level of playing: \(result)"
    }
}
