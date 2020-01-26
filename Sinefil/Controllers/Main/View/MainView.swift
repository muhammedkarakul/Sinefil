//
//  MainView.swift
//  Sinefil
//
//  Created by Muhammed KARAKUL on 25.01.2020.
//  Copyright © 2020 Muhammed KARAKUL. All rights reserved.
//

import UIKit

final class MainView: SFView {
    private lazy var centeredLabel: UILabel = {
        let label = UILabel()
        label.text = "Main View"
        label.font = Font.QuickSand.SemiBold.title
        return label
    }()
    
    override func prepareLayout() {
        addSubview(centeredLabel)
        centeredLabel.snp.makeConstraints { maker in
            maker.center.equalToSuperview()
        }
    }
}
