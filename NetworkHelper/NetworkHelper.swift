//
//  NetworkHelper.swift
//  NetworkHelper
//
//  Created by Tsering Lama on 12/6/19.
//  Copyright © 2019 Tsering Lama. All rights reserved.
//

import Foundation

// Create network helper here: A Singleton which only makes one instance of the class throughtout the application. Makes sure to make the default initializer private.
// Make a shared instance

class NetworkHelper {
    
    static let shared = NetworkHelper()
    
    private var session: URLSession
    
    private init() {
        session = URLSession.init(configuration: .default)
    }
    
    func performDataTask(userurl: String, completionHandler: @escaping (Result<Data,AppError>) -> ()) {
        
        guard let url = URL(string: userurl) else {
            completionHandler(.failure(.badURl(userurl)))
            return
        }
        
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                completionHandler(.failure(.networkClinetError(error)))
            }
            
            guard let urlResponse = response as? HTTPURLResponse else {
                completionHandler(.failure(.noResponse))
                return
            }
            
            guard let data = data else {
                completionHandler(.failure(.noData))
                return
            }
            
            switch urlResponse.statusCode {
            case 200...299: break
            default:
                completionHandler(.failure(.badStatusCode(urlResponse.statusCode)))
                return
            }
            
            completionHandler(.success(data))
        }
        dataTask.resume()
        
    }
    
}


