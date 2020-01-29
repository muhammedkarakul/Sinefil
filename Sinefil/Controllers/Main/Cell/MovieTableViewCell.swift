//
//  MovieTableViewCell.swift
//  Sinefil
//
//  Created by Muhammed KARAKUL on 27.01.2020.
//  Copyright © 2020 Muhammed KARAKUL. All rights reserved.
//

import UIKit

final class MovieTableViewCell: SFTableViewCell {
    private(set) lazy var posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Font.QuickSand.Regular.body
        return label
    }()
    
    override func configureAppearance() {
        super.configureAppearance()
        accessoryType = .disclosureIndicator
    }
    
    override func prepareLayout() {
        super.prepareLayout()
        setupPosterImageViewLayout()
        setupTitleLabelLayout()
    }
    
    private func setupPosterImageViewLayout() {
        addSubview(posterImageView)
        posterImageView.snp.makeConstraints { maker in
            maker.width.equalTo(LayoutConstants.posterWidth)
            maker.leading.equalTo(LayoutConstants.posterLeading)
            maker.top.equalTo(LayoutConstants.posterTop)
            maker.bottom.equalTo(LayoutConstants.posterBottom)
        }
    }
    
    private func setupTitleLabelLayout() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { maker in
            maker.left.equalTo(posterImageView.snp.right).offset(LayoutConstants.titleLeftOffset)
            maker.top.equalTo(LayoutConstants.titleTop)
            maker.bottom.equalTo(LayoutConstants.titleBottom)
            maker.trailing.equalTo(LayoutConstants.titleTrailing)
        }
    }
}
