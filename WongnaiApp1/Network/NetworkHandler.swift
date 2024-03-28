//
//  NetworkHandler.swift
//  WongnaiApp1
//
//  Created by Navathon Limamapar on 28/3/2567 BE.
//

import Foundation


class NetworkHandler {
    func requestData(from url: URL, completion: @escaping (Result<Data, DataError>) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                completion(.failure(.network(error)))
                return
            }
            
            guard let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            completion(.success(data))
        }
        task.resume()
    }
}
