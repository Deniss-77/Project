//
//  Variants.swift
//  Pryaniky
//
//  Created by Denis Kravets on 29.06.2021.
//

import Foundation

struct Variant: Codable {
    let id: Int
    let text: String
    
    func getVariant() -> String{
        return "id: \(id) вариант: \(text)"
    }
}
