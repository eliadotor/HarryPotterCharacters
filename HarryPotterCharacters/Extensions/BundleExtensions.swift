//
//  BundleExtensions.swift
//  HarryPotterCharacters
//
//  Created by Elia Dotor Puente on 2/2/22.
//

import Foundation

extension Bundle {
    var baseAPIUrl: URL {
        guard let url = infoDictionary?["API_BASE_URL"] as? String else {
            fatalError("Invalid Base url")
        }
        return URL(string: url)!
    }
}
