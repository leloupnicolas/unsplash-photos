//
//  FeedPhotosRepository.swift
//  UnsplashPhotos
//
//  Created by Nicolas LELOUP on 05/11/2024.
//

import Foundation

struct FeedPhotosRepository: Sendable {
    var getPhotos: @Sendable () async throws -> [Photo] = { [] }
}




