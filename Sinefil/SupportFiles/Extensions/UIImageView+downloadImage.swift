//
//  UIImageView+downloadImage.swift
//  Sinefil
//
//  Created by Muhammed KARAKUL on 21.02.2020.
//  Copyright © 2020 Muhammed KARAKUL. All rights reserved.
//

import UIKit

extension UIImageView {
    func downloadImage(from url: URL) {
        Network.getData(from: url) { data in
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }
    }
}
