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
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private(set) lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.font = Font.QuickSand.SemiBold.title
        label.textColor = .gray
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    override func prepareLayout() {
        super.prepareLayout()
        
        addSubview(centeredImageView)
        centeredImageView.snp.makeConstraints { maker in
            maker.center.equalToSuperview()
            maker.width.height.equalTo(LayoutConstants.centeredImageViewSize)
        }
        
        addSubview(messageLabel)
        messageLabel.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.leading.equalTo(LayoutConstants.messageLabelLeading)
            maker.trailing.equalTo(LayoutConstants.messageLabelTrailing)
            maker.bottom.equalTo(centeredImageView.snp.top).offset(LayoutConstants.messageLabelBottomOffset)
        }
    }
}
