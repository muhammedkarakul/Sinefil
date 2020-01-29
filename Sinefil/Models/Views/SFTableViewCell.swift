//
//  SFTableViewCell.swift
//  Sinefil
//
//  Created by Muhammed KARAKUL on 28.01.2020.
//  Copyright © 2020 Muhammed KARAKUL. All rights reserved.
//

import UIKit

class SFTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureAppearance()
        prepareLayout()
        linkInteractor()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
     Make apprearance changes here
     */
    internal func configureAppearance() {
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
