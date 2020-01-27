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
        label.font = Font.QuickSand.SemiBold.title
        return label
    }()
    
    private lazy var loadingActivityIndicatorView: UIActivityIndicatorView = {
        let activityIndicatorView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
        activityIndicatorView.startAnimating()
        return activityIndicatorView
    }()
    
    override func prepareLayout() {
        super.prepareLayout()
        
        setupWelcomeLabelLayout()
        setupLoadingActivityIndicatorViewLayout()
        
    }
    
    private func setupWelcomeLabelLayout() {
        addSubview(welcomeLabel)
        welcomeLabel.snp.makeConstraints { maker in
            maker.center.equalToSuperview()
        }
    }
    
    private func setupLoadingActivityIndicatorViewLayout() {
        addSubview(loadingActivityIndicatorView)
        loadingActivityIndicatorView.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(welcomeLabel.snp.bottom).offset(LayoutConstants.loadingActivityIndicatorTopOffset)
        }
    }
}
