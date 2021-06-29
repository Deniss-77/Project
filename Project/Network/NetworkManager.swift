//
//  NetworkManager.swift
//  Pryaniky
//
//  Created by Denis Kravets on 16.06.2021.
//

import UIKit

class NetworkManager {
    
    /// Получение данных с сервера
    /// - Parameter completion: someData c типом данных Model
    /// - Returns: Возвращает массив обработанных данных
    
    func fetchData(completion: @escaping (_ someData: [ModelData]) -> ()) {
        
        let urlString = "https://pryaniky.com/static/json/sample.json"
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url) { data, response, error in
            
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            var array = [ModelData]()
            
            do {
                let someData = try decoder.decode(ModelData.self, from: data)
                array.append(someData)
                completion(array)
            } catch let error {
                print(error)
            }
            
        }
        dataTask.resume()
    }
    
    
    /// Загрузка фото
    /// - Parameter completion: тип данных UIImage
    /// - Returns: Возращает фото по url
    
    func getPhoto(completion: @escaping(UIImage) -> ()) {
        
        let urlString = "https://pryaniky.com/static/img/logo-a-512.png"
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let data = data, let image = UIImage(data: data) {
                completion(image)
            }
        }.resume()
    }
    
}
