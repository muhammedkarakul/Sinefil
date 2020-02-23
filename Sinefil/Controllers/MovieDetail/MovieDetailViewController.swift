//
//  MovieDetailViewController.swift
//  Sinefil
//
//  Created by Muhammed KARAKUL on 28.01.2020.
//  Copyright © 2020 Muhammed KARAKUL. All rights reserved.
//

import UIKit
import Firebase

final class MovieDetailTableViewController: SFTableViewController {
    internal var movie: Movie?
    private var movieDetail: MovieDetail?
    private var posterImage: UIImage?
    
    private struct Section {
        var name: String?
        var data: String?
    }
    private var sections: Array<Section> = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchMovieDetail()
    }
    
    override func configureApperance() {
        super.configureApperance()
        
        title = movie?.title
    }
    
    override func registerTableViewCell() {
        super.registerTableViewCell()
        
        tableView.register(MoviePosterTableViewCell.self, forCellReuseIdentifier: "posterCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "defaultCell")
    }
    
    private func fetchMovieDetail() {
        guard
            let baseURL = ApiConstants.baseURL,
            let apiKey = ApiConstants.apiKey,
            let imdbID = movie?.imdbID
        else {
            return
        }
        guard let url = URL(string: "\(baseURL)/?apikey=\(apiKey)&i=\(imdbID)") else { return }
        getMovieDetail(from: url)
    }
    
    private func getMovieDetail(from url: URL) {
        startNetworkActivityIndicator()
        Network.getData(from: url) { data in
            do {
                let movieDetailData = try JSONDecoder().decode(MovieDetail.self, from: data)
                self.movieDetail = movieDetailData
                guard let movieDetailDict = self.movieDetail?.getDictionary() else { return }
                Analytics.logEvent("movie_detail", parameters: movieDetailDict as [String : Any])
                for (key, value) in movieDetailDict {
                    let section = Section(name: key, data: value)
                    self.sections.append(section)
                }
            } catch let err {
                print("Err", err)
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.stopNetworkActivityIndicator()
                self.fetchPoster()
            }
        }
    }
    
    private func fetchPoster() {
        guard
            let poster = movieDetail?.poster,
            let posterURL = URL(string: poster)
        else {
            return
        }
        getPoster(from: posterURL)
    }
    
    private func getPoster(from url: URL) {
        startNetworkActivityIndicator()
        Network.getData(from: url) { data in
            DispatchQueue.main.async {
                self.posterImage = UIImage(data: data)
                self.tableView.reloadData()
                self.stopNetworkActivityIndicator()
            }
        }
    }
}

// MARK: - UITableViewDataSource
extension MovieDetailTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count + 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "posterCell", for: indexPath) as! MoviePosterTableViewCell
            cell.posterImageView.image = posterImage
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath)
            cell.textLabel?.numberOfLines = 0
            if let data = sections[indexPath.section - 1].data {
                cell.textLabel?.text = data
            } else {
                cell.textLabel?.text = "N/A"
            }
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section != 0 {
            return sections[section - 1].name
        }
        
        return nil
    }
}
