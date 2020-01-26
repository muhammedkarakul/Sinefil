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
    static internal var apiKey = "" // Your api key
    static internal var baseURL = "http://www.omdbapi.com/?apikey=\(apiKey)&"
}
