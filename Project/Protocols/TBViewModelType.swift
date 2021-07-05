//
//  TBViewModelType.swift
//  Project
//
//  Created by Denis Kravets on 20.06.2021.
//

import Foundation

protocol TBViewModelType {
    
    var arrayOfPlayers: Boxing<[List]?> { get }
    func numberOfRows() -> Int
    func cellViewModel(for indexPath: IndexPath) -> TBCellViewModelType?
    func updateData() -> Void

}
