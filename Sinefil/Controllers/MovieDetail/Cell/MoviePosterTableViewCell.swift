//
//  MoviePosterTableViewCell.swift
//  Sinefil
//
//  Created by Muhammed KARAKUL on 28.01.2020.
//  Copyright © 2020 Muhammed KARAKUL. All rights reserved.
//

import UIKit

final class MoviePosterTableViewCell: SFTableViewCell {
    private(set) lazy var posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override func prepareLayout() {
        super.prepareLayout()
        
        addSubview(posterImageView)
        posterImageView.snp.makeConstraints { maker in
            maker.width.height.equalToSuperview()
        }
    }
}
