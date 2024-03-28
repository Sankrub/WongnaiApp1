//
//  ResponseHandler.swift
//  WongnaiApp1
//
//  Created by Navathon Limamapar on 28/3/2567 BE.
//

import Foundation


class ResponseHandler {
    // From api data that is JSON this class responsible for change it to use in swift. 
    func parse<T: Decodable>(data: Data, completion: (Result<T, DataError>) -> Void) {
        do {
            let decodedObject = try JSONDecoder().decode(T.self, from: data)
            completion(.success(decodedObject))
        } catch {
            completion(.failure(.decoding(error)))
        }
    }
}
