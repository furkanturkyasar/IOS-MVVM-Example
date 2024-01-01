//
//  NetworkManager.swift
//  MVVM-Example
//
//  Created by Furkan Türkyaşar on 30.12.2023.
//

import Foundation

//class NetworkManager {
//    static let shared = NetworkManager()
//    
//    private init() {
//        
//    }
//    
//    func download(url: URL, completion: @escaping (Result<Data, Error>) -> ()) {
//        
//        DispatchQueue.global(qos: .background).async {
//            URLSession.shared.dataTask(with: url) { data, response, error in
//                if let error = error {
//                    print(error.localizedDescription)
//                
//                    DispatchQueue.main.async {
//                        completion(.failure(error))
//                    }
//                    return
//                }
//                
//                guard
//                    let response = response as? HTTPURLResponse,
//                    response.statusCode == 200 else {
//                        DispatchQueue.main.async {
//                            completion(.failure(URLError(.badServerResponse)))
//                        }
//                        return
//                }
//                
//                guard let data = data else {
//                    DispatchQueue.main.async {
//                        completion(.failure(URLError(.badURL)))
//                        print("Data is empty!")
//                    }
//                    return
//                }
//                
//                DispatchQueue.main.async {
//                    completion(.success(data))
//                }
//            }.resume()
//        }
//    }
//}
//


class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {
        
    }
    
    @discardableResult
    func download(url: URL, completion: @escaping (Result<Data, Error>) -> ()) -> URLSessionDataTask {
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(error))
                return
            }
            
            guard 
                let response = response as? HTTPURLResponse,
                response.statusCode == 200 else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }
            
            guard 
                let data = data
            else {
                completion(.failure(URLError(.badURL)))
                print("Data is empty!")
                return
            }
            
            completion(.success(data))
        }
        dataTask.resume()
        
        return dataTask
    }
}


