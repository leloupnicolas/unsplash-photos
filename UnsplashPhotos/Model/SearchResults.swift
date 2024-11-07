//
//  SearchResults.swift
//  UnsplashPhotos
//
//  Created by Nicolas LELOUP on 05/11/2024.
//

import Foundation

struct SearchResults: Codable {
    static let empty = SearchResults(results: [])
    let results: [Photo]
}
