//
//  SomeData.swift
//  Pryaniky
//
//  Created by Denis Kravets on 25.06.2021.
//

import Foundation

struct SomeData: Codable {
    let text: String?
    let url: String?
    let selectedId: Int?
    let variants: [Variant]?
}
