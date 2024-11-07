//
//  PhotoStatisticsRepository.swift
//  UnsplashPhotos
//
//  Created by Nicolas LELOUP on 05/11/2024.
//
import Foundation

struct PhotoStatisticsRepository: Sendable {
    var getStatistics: @Sendable (String) async throws -> Photo.Statistics = { _ in return .zero }
}
