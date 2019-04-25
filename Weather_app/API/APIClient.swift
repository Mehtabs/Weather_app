//
//  APIClient.swift
//  Weather_app
//
//  Created by Mehtab Singh Sidhu on 2/12/19.
//  Copyright © 2019 Mehtab Singh Sidhu. All rights reserved.
//

// looked at the following video
// to help build the api client
// https://www.youtube.com/watch?v=icpNSBqGtzM&frags=pl%2Cwn


import Foundation

enum Either<V, E: Error> {
    case value(V)
    case error(E)
}

enum APIError: Error {
    case apiError
    case badResponse
    case jsonDecoder
    case unknown(String)
}

// for creating a request to an API
protocol APIClient {
    var session: URLSession { get }
    func fetch<V: Codable>(with request: URLRequest, completion: @escaping (Either<V, APIError>) -> Void)
}

extension APIClient {
    func fetch<V: Codable>(with request: URLRequest, completion: @escaping (Either<V, APIError>) -> Void) {
        // give a default value
        let task = session.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                completion(.error(.apiError))
                return
            }
            // check if our response is in this range
            guard let response = response as? HTTPURLResponse, 200..<300 ~= response.statusCode else {
                completion(.error(.badResponse))
                return
            }
            
            guard let value = try? JSONDecoder().decode(V.self, from: data!) else {
                completion(.error(.jsonDecoder))
                return
            }
            
            completion(.value(value))
            
        }
        
        task.resume()
    }
}
