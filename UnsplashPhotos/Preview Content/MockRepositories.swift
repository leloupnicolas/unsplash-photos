//
//  MockRepositories.swift
//  UnsplashPhotos
//
//  Created by Nicolas LELOUP on 05/11/2024.
//

import Foundation

final class MockRepositories {
    @Sendable
    func getPhotos() async -> [Photo] {
        return (0...10).map { _ in Photo.random() }
    }

    @Sendable
    func getStatistics(_: String) async -> Photo.Statistics {
        return Photo.Statistics(views: .random(), downloads: .random())
    }

    @Sendable
    func getPhotosFromUser(_: String) async -> [Photo] {
        return (0...10).map { _ in Photo.random() }
    }

    @Sendable
    func searchPhotos(_ pattern: String) async -> SearchResults {
        let photos = (0...10).map { _ in Photo.random() }
        return SearchResults(results: photos)
    }
}

extension FeedPhotosRepository {
    static var mock: Self = {
        let repository = MockRepositories()

        return Self(
            getPhotos: repository.getPhotos
        )
    }()
}

extension SearchPhotosRepository {
    static var mock: Self = {
        let repository = MockRepositories()

        return Self(
            searchPhotos: repository.searchPhotos(_:)
        )
    }()
}
