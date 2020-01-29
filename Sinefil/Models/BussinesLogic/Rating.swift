//
//  Rating.swift
//  Sinefil
//
//  Created by Muhammed KARAKUL on 28.01.2020.
//  Copyright © 2020 Muhammed KARAKUL. All rights reserved.
//

import Foundation

struct Rating: Codable {
    let source: String?
    let value: String?
    
    private enum CodingKeys: String, CodingKey {
        case source = "Source"
        case value = "Value"
    }
}
