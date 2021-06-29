//
//  TBViewModelType.swift
//  Pryaniky
//
//  Created by Denis Kravets on 20.06.2021.
//

import Foundation

protocol TBViewModelType {
    
    var arrayOfData: Boxing<[NameAndData]?> { get }
    func numberOfRows() -> Int
    func cellViewModel(for indexPath: IndexPath) -> TBCellViewModelType?
    func updateData(completion: @escaping (Boxing<[NameAndData]?>) -> ())

}
