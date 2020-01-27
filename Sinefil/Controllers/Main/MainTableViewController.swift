//
//  MainViewController.swift
//  Sinefil
//
//  Created by Muhammed KARAKUL on 25.01.2020.
//  Copyright © 2020 Muhammed KARAKUL. All rights reserved.
//

import UIKit

final class MainTableViewController: UITableViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}
