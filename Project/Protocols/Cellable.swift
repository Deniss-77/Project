//
//  Cellable.swift
//  Project
//
//  Created by Denis Kravets on 18.06.2021.
//

import Foundation

public protocol Cellable {
    static var nibName: String { get }
    static var identifier: String { get }
}

public extension Cellable {
    static var nibName: String { String(describing: Self.self) }
    static var identifier: String { String(describing: Self.self) }
}
