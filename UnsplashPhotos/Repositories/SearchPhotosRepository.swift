//
//  SearchPhotosRepository.swift
//  UnsplashPhotos
//
//  Created by Nicolas LELOUP on 05/11/2024.
//

import Foundation

struct SearchPhotosRepository: Sendable {
    var searchPhotos: @Sendable (String) async throws -> SearchResults = { _ in .empty }
}
