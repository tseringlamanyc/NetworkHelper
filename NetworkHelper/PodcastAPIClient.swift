//
//  PodcastAPIClient.swift
//  NetworkHelper
//
//  Created by Tsering Lama on 12/6/19.
//  Copyright © 2019 Tsering Lama. All rights reserved.
//

import Foundation

struct PodcastAPI {
    
    static func getPodcast(completionHandler: @escaping (Result<[Podcast], AppError>) -> ()) {
        
        let podcastURL = "https://itunes.apple.com/search?media=podcast&limit=200&term=swift"
        var podcasts = [Podcast]()
        
        NetworkHelper.shared.performDataTask(userurl: podcastURL) { (result) in
            switch result {
            case .failure(let appError):
                print("\(appError)")
            case .success(let data):
                do {
                    let podcastData = try JSONDecoder().decode(PodcastData.self, from: data)
                    podcasts = podcastData.results
                    completionHandler(.success(podcasts))
                } catch {
                    completionHandler(.failure(.decodingError(error)))
                }
            }
        }
    }
}
