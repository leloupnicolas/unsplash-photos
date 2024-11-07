//
//  EnvironmentKeys.swift
//  UnsplashPhotos
//
//  Created by Nicolas LELOUP on 05/11/2024.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var feedPhotosRepository: FeedPhotosRepository = FeedPhotosRepository(
        getPhotos: ApiClient().getPhotos
    )

    @Entry var photoStatisticsRepository: PhotoStatisticsRepository = PhotoStatisticsRepository(
        getStatistics: ApiClient().getPhotosStatistics(_:)
    )

    @Entry var userPhotosRepository: UserPhotosRepository = UserPhotosRepository(
        getUserPhotos: ApiClient().getUserPhotos(_:)
    )

    @Entry var searchPhotosRepository: SearchPhotosRepository = SearchPhotosRepository(
        searchPhotos: ApiClient().searchPhotos(_:)
    )
}
