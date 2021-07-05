//
//  TBCellViewModelType.swift
//  Project
//
//  Created by Denis Kravets on 20.06.2021.
//

import Foundation

protocol TBCellViewModelType {
    
    var name: String  { get }
    var type: String  { get }
    var url: String  { get }
    var rating: Int { get }
    var level: [Level] { get }
    
}
