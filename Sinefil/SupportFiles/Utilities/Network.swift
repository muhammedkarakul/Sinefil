//
//  Network.swift
//  Sinefil
//
//  Created by Muhammed KARAKUL on 21.02.2020.
//  Copyright © 2020 Muhammed KARAKUL. All rights reserved.
//

import Foundation

class Network {
    class func getData(from url: URL, completion: @escaping (Data) -> ()) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            guard let data = data else { return }
            completion(data)
        }.resume()
    }
}
