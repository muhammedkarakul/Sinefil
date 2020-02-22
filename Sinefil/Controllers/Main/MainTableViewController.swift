//
//  MainViewController.swift
//  Sinefil
//
//  Created by Muhammed KARAKUL on 25.01.2020.
//  Copyright © 2020 Muhammed KARAKUL. All rights reserved.
//

import UIKit
import ProgressHUD

final class MainTableViewController: SFTableViewController {
    private var isFirstAppear = true
    private let sectionNumber = 1
    
    private var movies: Array<Movie> = []
    
    private lazy var backgroundView: BackgroundView = {
        let view = BackgroundView()
        return view
    }()
    
    private lazy var movieSearchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = NSLocalizedString("search_bar_placeholder", comment: "Search bar place holder.")
        searchBar.sizeToFit()
        return searchBar
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.hidesBackButton = true
    }
    
    override func configureApperance() {
        super.configureApperance()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: movieSearchBar)
        tableView.keyboardDismissMode = .onDrag
    }
    
    override func linkInteractor() {
        super.linkInteractor()
        
        movieSearchBar.delegate = self
    }
    
    override func registerTableViewCell() {
        super.registerTableViewCell()
        
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: "movieCell")
    }
    
    private func updateView() -> Int {
        if movies.isEmpty {
            updateBackgroundView()
            tableView.backgroundView  = backgroundView
            tableView.separatorStyle  = .none
            return .zero
        } else {
            tableView.backgroundView = nil
            tableView.separatorStyle  = .singleLine
            return sectionNumber
        }
    }
    
    private func updateBackgroundView() {
        if isFirstAppear {
            backgroundView.centeredImageView.image = UIImage(named: "icon_movie_search")
            backgroundView.messageLabel.text = NSLocalizedString("background_view_search_movie", comment: "Initial background view title.")
        } else {
            backgroundView.centeredImageView.image = UIImage(named: "icon_movie_notfound")
            backgroundView.messageLabel.text = NSLocalizedString("background_view_no_result_found", comment: "No response movie search error title.")
        }
    }
    
    private func searchMovie(byName name: String) {
        guard
            let baseURL = ApiConstants.baseURL,
            let apiKey = ApiConstants.apiKey
        else {
            return
        }
        
        let spacelessName = name.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)
        guard let url = URL(string: "\(baseURL)/?apikey=\(apiKey)&s=\(spacelessName)") else { return }
        
        ProgressHUD.show()
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            self.movies = []
            guard let data = data else { return }
            DispatchQueue.main.async {
                do {
                    let searchData = try JSONDecoder().decode(Search.self, from: data)
                    self.movies = searchData.search
                    self.tableView.reloadData()
                    ProgressHUD.dismiss()
                } catch let err {
                    print("Err", err)
                }
            }
        }
        task.resume()
    }
}

// MARK: - UISearchBarDelegate
extension MainTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        isFirstAppear = false
        guard let searchText = searchBar.text else { return }
        searchMovie(byName: searchText)
    }
}

// MARK: - UITableViewDelegate
extension MainTableViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return LayoutConstants.tableViewCellHeight
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieDetailTableViewController = MovieDetailTableViewController()
        movieDetailTableViewController.movie = movies[indexPath.row]
        navigationController?.pushViewController(movieDetailTableViewController, animated: true)
    }
}

// MARK: - UITableViewDataSource
extension MainTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return updateView()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MovieTableViewCell(style: .default, reuseIdentifier: "movieCell")
        let currentMovie = movies[indexPath.row]
        guard
            let title = currentMovie.title,
            let year = currentMovie.year,
            let poster = currentMovie.poster
        else {
            return cell
        }
        
        cell.titleLabel.text = "\(title)(\(year))"
        
        guard let posterURL = URL(string: poster) else { return cell }
        cell.posterImageView.downloadImage(from: posterURL)
        return cell
    }
}
