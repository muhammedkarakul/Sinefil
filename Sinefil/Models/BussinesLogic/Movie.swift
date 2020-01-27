//
//  Movie.swift
//  Sinefil
//
//  Created by Muhammed KARAKUL on 27.01.2020.
//  Copyright © 2020 Muhammed KARAKUL. All rights reserved.
//

import Foundation

struct Movie: Codable {
    let title: String?
    let year: String?
    let imdbID: String?
    let type: String?
    let poster: String?
    
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
    }
}
