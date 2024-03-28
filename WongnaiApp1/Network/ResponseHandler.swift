//
//  ResponseHandler.swift
//  WongnaiApp1
//
//  Created by Navathon Limamapar on 28/3/2567 BE.
//

import Foundation


class ResponseHandler {
    func parse<T: Decodable>(data: Data, completion: (Result<T, DataError>) -> Void) {
        do {
            let decodedObject = try JSONDecoder().decode(T.self, from: data)
            completion(.success(decodedObject))
        } catch {
            completion(.failure(.decoding(error)))
        }
    }
}
