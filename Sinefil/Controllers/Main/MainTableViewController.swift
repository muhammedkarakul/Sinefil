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
    
    private var movies: Array<String> = [] {
        didSet {
            updateView()
        }
    }
    
    private lazy var moviewSearchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = NSLocalizedString("search_bar_placeholder", comment: "Search bar place holder.")
        searchBar.sizeToFit()
        return searchBar
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.hidesBackButton = true
        fetchMovies()
    }
    
    override func configureApperance() {
        super.configureApperance()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: moviewSearchBar)
        tableView.keyboardDismissMode = .onDrag
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = movies[indexPath.row]
        return cell
    }
    
    private func updateView() {
        if movies.isEmpty {
            print("No movie found!")
        } else {
            print("Moview founded.")
        }
    }
    
    private func fetchMovies() {
        Alamofire.request(ApiConstants.baseURL + "t=the+godfather").responseJSON { response in
            if let error = response.error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            print(response)
        }
    }
}
