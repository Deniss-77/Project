//
//  TBCellViewModel.swift
//  Project
//
//  Created by Denis Kravets on 20.06.2021.
//

import Foundation

class TBCellViewModel: TBCellViewModelType {
    
    // MARK: Properties
    
    private var model: List
    
    var name: String {
        return "Name: \(model.name)"
    }
    
    var type: String {
        return "Position: \(model.parameters.type)"
    }
    
    var url: String {
        return model.parameters.url ?? ""
    }
    
    var rating: Int {
        return model.parameters.rating
    }
    
    var level: [Level] {
        return model.parameters.level
    }
    
    // MARK: Initializer
    
    init(player: List) {
        self.model = player
    }
    
}
