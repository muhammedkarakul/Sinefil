//
//  SFTableViewController.swift
//  Sinefil
//
//  Created by Muhammed KARAKUL on 27.01.2020.
//  Copyright © 2020 Muhammed KARAKUL. All rights reserved.
//

import UIKit

class SFTableViewController: UITableViewController {
    
    private lazy var networkActivityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .whiteLarge
        return activityIndicator
    }()
    
    private lazy var darkTransparentView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width / 2, height: self.view.bounds.width / 2)
        view.center = self.view.center
        view.backgroundColor = .black
        view.alpha = 0.5
        view.layer.cornerRadius = 25.0
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureApperance()
        registerTableViewCell()
        prepareLayout()
        linkInteractor()
    }
    
    /**
     Make apperance changes here
     */
    internal func configureApperance() {
    }
    
    /**
     Prepare layout here
     */
    internal func prepareLayout() {
    }
    
    /**
     Define link interactions here
     */
    internal func linkInteractor() {
    }
    
    /**
     Register table view cells here
     */
    internal func registerTableViewCell() {
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    internal func startNetworkActivityIndicator() {
        view.isUserInteractionEnabled = false
        view.addSubview(darkTransparentView)
        view.addSubview(networkActivityIndicator)
        networkActivityIndicator.startAnimating()
    }
    
    internal func stopNetworkActivityIndicator() {
        view.isUserInteractionEnabled = true
        networkActivityIndicator.stopAnimating()
        darkTransparentView.removeFromSuperview()
    }
}
