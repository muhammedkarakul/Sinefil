//
//  Alert.swift
//  Sinefil
//
//  Created by Muhammed KARAKUL on 25.01.2020.
//  Copyright © 2020 Muhammed KARAKUL. All rights reserved.
//

import UIKit

class Alert {
    internal class var noInternetConnection: UIAlertController {
        let alert = UIAlertController(
            title: "No Internet Connection",
            message: "Internet connection is not available. Sinefil is not available offline. Please check your internet connection.",
            preferredStyle: .alert
        )
        let settingsAction = UIAlertAction(title: "Settings", style: .default) { _ in
            let settingsUrl = URL(string: UIApplication.openSettingsURLString)
            if let url = settingsUrl {
                UIApplication.shared.openURL(url)
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        alert.addAction(settingsAction)
        return alert
    }
}
