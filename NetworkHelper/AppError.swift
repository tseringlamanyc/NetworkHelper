//
//  AppError.swift
//  NetworkHelper
//
//  Created by Tsering Lama on 12/6/19.
//  Copyright © 2019 Tsering Lama. All rights reserved.
//

import Foundation

// Error handling against network request

enum AppError: Error {
    
    case badURl(String)
    case noResponse
    case networkClinetError(Error)
    case noData
    case decodingError(Error)
    case badStatusCode(Int)
    case badMIMEType
    
}

