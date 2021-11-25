//
//  Networkmanager.swift
//  NetworkAPIPractice
//
//  Created by Abdullah AlRashoudi on 11/16/21.
//

import Foundation
struct User: Codable {
    let id: Int
    let name: String
    let username: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}
class NetworkManager {
    static let shared = NetworkManager()
    
    func fetchData(completion: @escaping([User]) -> Void) {
        let urlString = "https://jsonplaceholder.typicode.com/users"
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
            }
            
            guard let data = data else {return}
            do {
                let decodeUsers = try JSONDecoder().decode([User].self, from: data)
                completion(decodeUsers)
//                print(decodeUsers)
            } catch {
                print(error.localizedDescription)
                
            }
           
//            do {
//                let decodeAddress = try JSONDecoder().decode([Address].self, from: data)
//                print(decodeAddress)
//            } catch {
//                print(error.localizedDescription)
//            }
            
        }.resume()
        
        
        
    }
    
    
}
