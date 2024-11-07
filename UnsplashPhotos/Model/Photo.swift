//
//  Photo.swift
//  UnsplashPhotos
//
//  Created by Nicolas LELOUP on 05/11/2024.
//

import Foundation

struct Photo: Codable, Identifiable {
    let id: String
    var description: String?
    let likes: Int
    let user: Author
    let urls: Urls
}
