//
//  ViewController.swift
//  Sinefil
//
//  Created by Muhammed KARAKUL on 25.01.2020.
//  Copyright © 2020 Muhammed KARAKUL. All rights reserved.
//

import UIKit
import Firebase

final class SplashScreenViewController: SFViewController {
    private let welcomeMessageConfigKey = "welcome_message"
    private let remoteConfig = RemoteConfig.remoteConfig()
    
    private lazy var splashScreenView: SplashScreenView = {
        let view = SplashScreenView()
        return view
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
        setupRemoteConfigDefaults()
        fetchConfig()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkInternetConnection()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func configureApperance() {
        super.configureApperance()
        view = splashScreenView
    }
    
    private func checkInternetConnection() {
        Utilities.isInternetConnectionAvailable { isInternetConnectionAvailable in
            if isInternetConnectionAvailable {
                self.goToMainView()
            } else {
                self.present(Alert.noInternetConnection, animated: true, completion: nil)
            }
        }
    }
    
    private func goToMainView() {
        do {
            sleep(3)
        }
        let mainViewController = MainTableViewController()
        self.navigationController?.pushViewController(mainViewController, animated: true)
    }
    
    private func setupRemoteConfigDefaults() {
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
        
        remoteConfig.setDefaults(fromPlist: "RemoteConfigDefaults")
    }
    
    private func fetchConfig() {
        splashScreenView.welcomeLabel.text = remoteConfig[welcomeMessageConfigKey].stringValue

        let expirationDuration = 0
        
        remoteConfig.fetch(withExpirationDuration: TimeInterval(expirationDuration)) { (status, error) -> Void in
          if status == .success {
            print("Config fetched!")
            self.remoteConfig.activate(completionHandler: { (error) in
            })
          } else {
            print("Config not fetched")
            print("Error: \(error?.localizedDescription ?? "No error available.")")
          }
            self.splashScreenView.welcomeLabel.text = self.remoteConfig[self.welcomeMessageConfigKey].stringValue
        }
    }
}

