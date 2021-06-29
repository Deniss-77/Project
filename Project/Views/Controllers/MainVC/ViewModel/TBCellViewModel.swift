//
//  TBCellViewModel.swift
//  Pryaniky
//
//  Created by Denis Kravets on 20.06.2021.
//

import Foundation

class TBCellViewModel: TBCellViewModelType {
    
    // MARK: Properties
        
        private var model: NameAndData
        
        var name: String {
            return "Название: \(model.name)"
        }
        
        var textBlock: String {
            return "Блок текста: \(model.data.text ?? "---")"
        }
        
        var selector: String {
            return "Селектор: \(model.data.selectedId ?? 0)"
        }
        
        var url: String {
            return model.data.url ?? ""
        }
        
        var variant: [Variant] {
            return model.data.variants ?? []
        }
        
        // MARK: Initializer
        
        init(data: NameAndData) {
            self.model = data
        }
}
