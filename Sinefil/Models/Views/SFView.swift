//
//  SFView.swift
//  Sinefil
//
//  Created by Muhammed KARAKUL on 25.01.2020.
//  Copyright © 2020 Muhammed KARAKUL. All rights reserved.
//

import UIKit

class SFView: UIView {
    init() {
        super.init(frame: CGRect())
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
