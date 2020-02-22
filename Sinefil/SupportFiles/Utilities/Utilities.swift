//
//  Utilities.swift
//  Sinefil
//
//  Created by Muhammed KARAKUL on 25.01.2020.
//  Copyright © 2020 Muhammed KARAKUL. All rights reserved.
//

import Foundation

final class Utilities {
    internal class func isInternetConnectionAvailable(completion: @escaping((Bool) -> Void)) {
        guard let url = URL(string: "https://www.google.com") else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("No Internet Connection Found: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    completion(false)
                }
            }
            DispatchQueue.main.async {
                completion(true)
            }
        }
        task.resume()
    }
    
    internal class func readDataFromPlist(_ name: String) -> NSDictionary? {
        var nsDictionary: NSDictionary?
        if let path = Bundle.main.path(forResource: name, ofType: "plist") {
           nsDictionary = NSDictionary(contentsOfFile: path)
        }
        return nsDictionary
    }
}
