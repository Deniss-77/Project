//
//  Boxing.swift
//  Pryaniky
//
//  Created by Denis Kravets on 20.06.2021.
//

import Foundation

class Boxing<T> {
    
    typealias Listener = (T) -> ()
    
    // MARK: Properties
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    private var listener: Listener?
    
    // MARK: Initializer
    
    init(_ value: T) {
        self.value = value
    }
    
    // MARK: Methods
    
    func bind(_ listener: @escaping Listener) {
        self.listener = listener
        listener(value)
    }
}
