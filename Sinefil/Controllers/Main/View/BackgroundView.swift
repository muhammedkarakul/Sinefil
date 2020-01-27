//
//  MainTableBackgroundView.swift
//  Sinefil
//
//  Created by Muhammed KARAKUL on 27.01.2020.
//  Copyright © 2020 Muhammed KARAKUL. All rights reserved.
//

import UIKit

final class BackgroundView: SFView {
    private(set) lazy var centeredImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private(set) lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.font = Font.QuickSand.SemiBold.title
        if #available(iOS 13.0, *) {
            label.textColor = .systemGray3
        } else {
            label.textColor = .lightGray
        }
        return label
    }()
    
    override func prepareLayout() {
        super.prepareLayout()
        
        addSubview(centeredImageView)
        centeredImageView.snp.makeConstraints { maker in
            maker.center.equalToSuperview()
            maker.width.height.equalTo(240.0)
        }
        
        addSubview(messageLabel)
        messageLabel.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(centeredImageView.snp.bottom).offset(32.0)
        }
    }
}
