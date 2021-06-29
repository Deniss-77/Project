//
//  TBCellViewModelType.swift
//  Pryaniky
//
//  Created by Denis Kravets on 20.06.2021.
//

import Foundation

protocol TBCellViewModelType: AnyObject {
    
    var name: String  { get }
    var textBlock: String  { get }
    var selector: String  { get }
    var url: String  { get }
    var variant: [Variant] { get }
    
}
