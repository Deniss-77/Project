//
//  NetworkManager.swift
//  Project
//
//  Created by Denis Kravets on 16.06.2021.
//

import UIKit
import Alamofire

class NetworkManager {
    
    /// Получение данных с сервера
    /// - Parameter completion: players  c типом данных ModelData?
    /// - Returns: Возвращает массив полученных данных
    
    func fetchData(completion: @escaping (_ players: [ModelData]?) -> ()) {
        
        let urlString = "https://run.mocky.io/v3/571a7e66-cb66-4005-8b5a-cbe247e15013"
        guard let url = URL(string: urlString) else { return }
        
        AF.request(url).responseDecodable(of: ModelData.self) { (response) in
            
            switch response.result {
            case .success(let data):
                var playerArray = [ModelData]()
                playerArray.append(data)
                completion(playerArray)
            case .failure:
                completion(nil)
            }
        }
        
    }
    
    /// Загрузка фото
    /// - Parameter completion: тип данных UIImage?
    /// - Returns: Возращает фото по url
    
    func getPhoto(url: String, completion: @escaping(UIImage?) -> () ) {
        
        let urlString = url
        guard let url = URL(string: urlString) else { return }
        
        AF.request(url).responseData { (response) in
            switch response.result {
            case .success(let data):
                guard let image = UIImage(data: data) else { return }
                completion(image)
            case .failure:
                completion(nil)
            }
        }
    }
    
}
