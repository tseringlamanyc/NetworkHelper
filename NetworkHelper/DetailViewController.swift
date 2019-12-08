//
//  ViewController.swift
//  NetworkHelper
//
//  Created by Tsering Lama on 12/6/19.
//  Copyright © 2019 Tsering Lama. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var applePodcast: UILabel!
    
    var podcast: Podcast!

    override func viewDidLoad() {
        super.viewDidLoad()
        applePodcast.text = podcast.collectionName
        title = podcast.primaryGenreName
    }
    
    @IBAction func loadPressed(_ sender: UIBarButtonItem) {
        NetworkHelper.shared.performDataTask(userurl: podcast.artworkUrl600) { (result) in
            switch result {
            case .failure(let appError):
                print("\(appError)")
            case .success(let data):
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self.imageView.image = image
                }
            }
        }
    }
}

