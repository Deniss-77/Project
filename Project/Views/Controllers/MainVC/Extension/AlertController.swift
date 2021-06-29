//
//  AlertController.swift
//  Pryaniky
//
//  Created by Denis Kravets on 18.06.2021.
//

import UIKit

extension MainVC {
    
    func alertControllerOfName() {
        let alert = UIAlertController(title: "Что инициировало?", message: "Название", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(ok)
        self.present(alert, animated: true)
    }
    
    func alertControllerOfTextBlock() {
        let alert = UIAlertController(title: "Что инициировало?", message: "Блок текста", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(ok)
        self.present(alert, animated: true)
    }
    
    func alertControllerOfSelected() {
        let alert = UIAlertController(title: "Что инициировало?", message: "Cелектор", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(ok)
        self.present(alert, animated: true)
    }
    
}
