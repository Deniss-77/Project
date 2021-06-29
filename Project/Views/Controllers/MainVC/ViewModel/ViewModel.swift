//
//  ViewModel.swift
//  Pryaniky
//
//  Created by Denis Kravets on 16.06.2021.
//

import Foundation

class ViewModel: TBViewModelType {
    
    // MARK: Properties
    
    private var networkManager = NetworkManager()
    private var arrayOfView: [String] = []
    var arrayOfData: Boxing<[NameAndData]?> = Boxing(nil)

    // MARK: Methods
    
    func numberOfRows() -> Int {
        return arrayOfView.count
    }
    
    func cellViewModel(for indexPath: IndexPath) -> TBCellViewModelType? {
        let currentViewName = arrayOfView[indexPath.row]
        guard let currentData = arrayOfData.value?.first(where: { $0.name == currentViewName }) else { return nil }
        return TBCellViewModel(data: currentData)
    }
    
    func updateData(completion: @escaping (Boxing<[NameAndData]?>) -> ()) {
        networkManager.fetchData { model in
            self.arrayOfView = model.first?.view ?? [""]
            self.arrayOfData = Boxing(model.first?.data)
            completion(self.arrayOfData)
        }
    }
    
}


