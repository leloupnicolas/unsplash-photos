//
//  UserPhotosRepository.swift
//  UnsplashPhotos
//
//  Created by Nicolas LELOUP on 05/11/2024.
//
import Foundation

struct UserPhotosRepository: Sendable {
    var getUserPhotos: @Sendable (String) async throws -> [Photo] = { _ in [] }
}
