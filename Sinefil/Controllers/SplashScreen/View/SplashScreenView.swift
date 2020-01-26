//
//  InitialView.swift
//  Sinefil
//
//  Created by Muhammed KARAKUL on 25.01.2020.
//  Copyright © 2020 Muhammed KARAKUL. All rights reserved.
//

import UIKit

final class SplashScreenView: SFView {
    
    private(set) lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Loodos"
        label.font = Font.QuickSand.SemiBold.title
        return label
    }()
    
    override func prepareLayout() {
        super.prepareLayout()
        
        addSubview(welcomeLabel)
        welcomeLabel.snp.makeConstraints { maker in
            maker.center.equalToSuperview()
        }
    }
}
