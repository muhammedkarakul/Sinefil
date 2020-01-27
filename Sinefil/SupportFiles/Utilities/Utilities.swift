//
//  Utilities.swift
//  Sinefil
//
//  Created by Muhammed KARAKUL on 25.01.2020.
//  Copyright © 2020 Muhammed KARAKUL. All rights reserved.
//

import Foundation
import Alamofire

final class Utilities {
    internal class func isInternetConnectionAvailable(completion: @escaping((Bool) -> Void)) {
        let url = "https://www.google.com"
        Alamofire.request(url).responseString { response in
            if let error = response.error {
                print("No Internet Connection Found: \(error.localizedDescription)")
                completion(false)
            }
            completion(true)
        }
    }
    
    internal class func readDataFromPlist(_ name: String) -> NSDictionary? {
        var nsDictionary: NSDictionary?
        if let path = Bundle.main.path(forResource: name, ofType: "plist") {
           nsDictionary = NSDictionary(contentsOfFile: path)
        }
        return nsDictionary
    }
}
