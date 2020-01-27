//
//  MainViewController.swift
//  Sinefil
//
//  Created by Muhammed KARAKUL on 25.01.2020.
//  Copyright © 2020 Muhammed KARAKUL. All rights reserved.
//

import UIKit
import Alamofire

final class MainTableViewController: SFTableViewController {
    private var isFirstAppear = true
    
    private var movies: Array<String> = [] {
        didSet {
            _ = updateView()
            tableView.reloadData()
        }
    }
    
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
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return updateView()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = movies[indexPath.row]
        return cell
    }
    
    private func updateView() -> Int {
        if movies.isEmpty {
            if isFirstAppear {
                backgroundView.centeredImageView.image = UIImage(named: "icon_movie_search")
                backgroundView.messageLabel.text = "Search a movie."
            } else {
                backgroundView.centeredImageView.image = UIImage(named: "icon_movie_notfound")
                backgroundView.messageLabel.text = "No movie found!"
            }
            
            tableView.backgroundView  = backgroundView
            tableView.separatorStyle  = .none
            return 0
        } else {
            tableView.backgroundView = nil
            tableView.separatorStyle  = .singleLine
            return 1
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
        
        Alamofire.request("\(baseURL)/?apikey=\(apiKey)&s=\(spacelessName)").responseJSON { response in
            if let error = response.error {
                print("Error: \(error.localizedDescription)")
                return
            }
            print(response)
        }
    }
}

extension MainTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        isFirstAppear = false
        //guard let searchText = searchBar.text else { return }
        movies = ["mov1", "mov2", "mov3"]
        //searchMovie(byName: searchText)
    }
}
