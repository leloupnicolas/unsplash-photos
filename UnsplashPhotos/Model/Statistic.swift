//
//  Statistic.swift
//  UnsplashPhotos
//
//  Created by Nicolas LELOUP on 05/11/2024.
//

import Foundation

struct Statistic: Codable {
    static let zero = Statistic(total: 0)
    static func random() -> Statistic { Statistic(total: Int.random(in: 0...1024)) }

    var total: Int
}
