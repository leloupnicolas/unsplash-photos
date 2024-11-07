//
//  Photo+Statistics.swift
//  UnsplashPhotos
//
//  Created by Nicolas LELOUP on 05/11/2024.
//

import Foundation

extension Photo {
    struct Statistics: Codable {
        static let zero = Statistics(views: .zero, downloads: .zero)

        var views: Statistic
        var downloads: Statistic
    }
}
