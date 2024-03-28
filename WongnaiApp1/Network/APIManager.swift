//
//  APIManager.swift
//  WongnaiApp1
//
//  Created by Navathon Limamapar on 26/3/2567 BE.
//

import Foundation


enum DataError: Error {
    case invalidResponse
    case invalidURL
    case invalidData
    case network(Error?)
    case decoding(Error?)
}

final class APIManager {
    static let shared = APIManager()
    private let networkHandler: NetworkHandler
    private let responseHandler: ResponseHandler
    
    init(networkHandler: NetworkHandler = NetworkHandler(),
         responseHandler: ResponseHandler = ResponseHandler()) {
        self.networkHandler = networkHandler
        self.responseHandler = responseHandler
    }
    
    // for pulling data from url using along with class networkHandler and responseHandler
    func fetchData(completion: @escaping (Result<[Photo], DataError>) -> Void) {
        guard let url = URL(string: Constant.API.DataUrl) else {
            completion(.failure(.invalidURL))
            return
        }
        networkHandler.requestData(from: url) { [weak self] result in
            switch result {
            case .success(let data):
                self?.responseHandler.parse(data: data) { (result: Result<DataModel, DataError>) in
                    switch result {
                    case .success(let dataModel):
                        completion(.success(dataModel.photos))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}





