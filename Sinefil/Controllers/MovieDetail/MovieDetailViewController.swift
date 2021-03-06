//
//  MovieDetailViewController.swift
//  Sinefil
//
//  Created by Muhammed KARAKUL on 28.01.2020.
//  Copyright © 2020 Muhammed KARAKUL. All rights reserved.
//

import UIKit
import ProgressHUD
import Firebase

final class MovieDetailTableViewController: SFTableViewController {
    internal var movie: Movie?
    private var movieDetail: MovieDetail?
    
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
        
        ProgressHUD.show()
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else { return }
            do {
                let movieDetailData = try JSONDecoder().decode(MovieDetail.self, from: data)
                self.movieDetail = movieDetailData
                
                guard let movieDetailDict = self.movieDetail?.getDictionary() else { return }
                
                Analytics.logEvent("movie_detail", parameters: movieDetailDict as [String : Any])
                
                for (key, value) in movieDetailDict {
                    let section = Section(name: key, data: value)
                    self.sections.append(section)
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    ProgressHUD.dismiss()
                }
                
            } catch let err {
                print("Err", err)
            }
        }
        task.resume()
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
            guard let poster = movieDetail?.poster else { return cell }
            guard let posterURL = URL(string: poster) else { return cell }
            cell.posterImageView.downloadImage(from: posterURL)
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
