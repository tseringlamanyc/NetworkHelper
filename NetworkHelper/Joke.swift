//
//  Joke.swift
//  NetworkHelper
//
//  Created by Tsering Lama on 12/6/19.
//  Copyright © 2019 Tsering Lama. All rights reserved.
//

import Foundation

struct Joke: Decodable {
    
    let id: Int
    let type: String
    let setup: String
    let punchline: String
    
}


