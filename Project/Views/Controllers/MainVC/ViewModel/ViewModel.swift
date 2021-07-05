//
//  ViewModel.swift
//  Project
//
//  Created by Denis Kravets on 16.06.2021.
//

import Foundation

class ViewModel: TBViewModelType {
    
    // MARK: Properties
    
    private var networkManager = NetworkManager()
    private var arrayOrder: [String] = []
    var arrayOfPlayers: Boxing<[List]?> = Boxing(nil) {
        didSet {
            print("xren")
        }
    }

    // MARK: Methods
    
    func numberOfRows() -> Int {
        return arrayOrder.count
    }
    
    func cellViewModel(for indexPath: IndexPath) -> TBCellViewModelType? {
        let currentOrder = arrayOrder[indexPath.row]
        guard let currentPlayer = arrayOfPlayers.value?.first(where: { $0.name == currentOrder }) else { return nil }
        return TBCellViewModel(player: currentPlayer)
    }
    
    func updateData() {
        networkManager.fetchData { [weak self] model in
            self?.arrayOrder = model?.first?.order ?? [""]
            self?.arrayOfPlayers.value = model?.first?.list
        }
    }
    
}


