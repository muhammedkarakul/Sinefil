//
//  Search.swift
//  Sinefil
//
//  Created by Muhammed KARAKUL on 27.01.2020.
//  Copyright © 2020 Muhammed KARAKUL. All rights reserved.
//

import Foundation

struct Search: Codable {
    let search: [Movie]
    
    private enum CodingKeys: String, CodingKey {
        case search = "Search"
    }
}
