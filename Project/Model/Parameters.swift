//
//  Parameters.swift
//  Project
//
//  Created by Denis Kravets on 25.06.2021.
//

import Foundation

struct Parameters: Codable {
    let type: String
    let url: String?
    let rating: Int
    let level: [Level]
}
