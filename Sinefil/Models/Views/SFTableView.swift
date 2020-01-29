//
//  SFTableView.swift
//  Sinefil
//
//  Created by Muhammed KARAKUL on 28.01.2020.
//  Copyright © 2020 Muhammed KARAKUL. All rights reserved.
//

import UIKit

class SFTableView: UITableView {
    init() {
        super.init(frame: CGRect(), style: .plain)
        configureApperance()
        prepareLayout()
        linkInteractor()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
     Make apprearance changes here
     */
    internal func configureApperance() {
        if #available(iOS 13.0, *) {
            backgroundColor = .systemBackground
        } else {
            backgroundColor = .white
        }
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
}
