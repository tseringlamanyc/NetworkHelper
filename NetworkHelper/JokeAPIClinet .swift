//
//  JokeAPIClinet .swift
//  NetworkHelper
//
//  Created by Tsering Lama on 12/6/19.
//  Copyright © 2019 Tsering Lama. All rights reserved.
//

import Foundation

struct JokeAPIClient {
    
    static func getJokes() -> [Joke] {
        let postmanURL = "https://opentdb.com/api.php?amount=10&encode=url3986"
        var jokes = [Joke]()
        
        NetworkHelper.shared.performDataTask(userurl: postmanURL) { (result) in
            switch result {
            case .failure(let appError):
                print("\(appError)")
                
            case .success(let data):
                
                do {
                    jokes = try JSONDecoder().decode([Joke].self, from: data)
                    jokes = self.getJokes()
                } catch {
                    fatalError("\(error)")
                }
            }
        }
        return jokes
    }
}
