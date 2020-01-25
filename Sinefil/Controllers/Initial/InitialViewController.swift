//
//  ViewController.swift
//  Sinefil
//
//  Created by Muhammed KARAKUL on 25.01.2020.
//  Copyright © 2020 Muhammed KARAKUL. All rights reserved.
//

import UIKit

final class InitialViewController: SFViewController {
    
    private lazy var initialView: InitialView = {
        let view = InitialView()
        return view
    }()
    
    override func configureApperance() {
        super.configureApperance()
        view = initialView
        title = "Initial View"
    }
}

