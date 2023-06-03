//
//  APICaller.swift
//  WorkingwithAPI
//
//  Created by e.mubarakov on 29.05.2023.
//

import Foundation

enum NetworkError: Error {
    case urlError
    case canNotParseData
}

class APICaller {
    
    static func getPetitions(competionHandler: @escaping (_ result: Result<Petitions, NetworkError>) -> Void) {
        
        let urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
        
        guard let url = URL(string: urlString) else {
            competionHandler(.failure(.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                competionHandler(.failure(.canNotParseData))
                print(error)
            }
            
            guard let json = data else {return}
            
            do {
                let result = try JSONDecoder().decode(Petitions.self, from: json)
                DispatchQueue.main.async {
                    competionHandler(.success(result))
                }
            }
            catch {
                competionHandler(.failure(.canNotParseData))
                print(error.localizedDescription)
            }
        }.resume()
    }
}
