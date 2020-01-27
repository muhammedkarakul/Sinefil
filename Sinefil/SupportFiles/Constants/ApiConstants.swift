//
//  Constants.swift
//  Sinefil
//
//  Created by Muhammed KARAKUL on 25.01.2020.
//  Copyright © 2020 Muhammed KARAKUL. All rights reserved.
//

import Foundation

struct ApiConstants {
    // Search movie with name example -> http://www.omdbapi.com/?apikey=12345678&t=the+godfather
    // Create a plist file with "Private-Info" named. Add your api key with "ApiKey" key and make value your api key.
    static internal var apiKey: String {
        get {
            guard let readedApiKey = Utilities.readDataFromPlist("Private-Info")?["ApiKey"] as? String else { return "" }
            return readedApiKey
        }
    }
    static internal var baseURL = "http://www.omdbapi.com/?apikey=\(apiKey)&"
}
