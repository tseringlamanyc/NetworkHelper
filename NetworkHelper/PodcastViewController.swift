//
//  PodcastViewController.swift
//  NetworkHelper
//
//  Created by Tsering Lama on 12/8/19.
//  Copyright © 2019 Tsering Lama. All rights reserved.
//

import UIKit

class PodcastViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var podcasts = [Podcast]() {
      didSet {
        DispatchQueue.main.async {
        self.tableView.reloadData()
        }
      }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPodcast()
        tableView.dataSource = self
    }
    
    func loadPodcast () {
    let loadData = PodcastAPI.getPodcast { (result) in
            switch result {
            case .failure(let appError):
                print("\(appError)")
            case .success(let loadData):
                DispatchQueue.main.async {
                    self.podcasts = loadData
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? DetailViewController, let indexpath = tableView.indexPathForSelectedRow else {
            return
        }
        detailVC.podcast = podcasts[indexpath.row]
    }

}

extension PodcastViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return podcasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "podcastCell", for: indexPath)
        let aPodcast = podcasts[indexPath.row]
        cell.textLabel?.text = aPodcast.artistName
        return cell
    }
}
