//
//  ApiManager.swift
//  UnsplashPhotos
//
//  Created by Nicolas LELOUP on 05/11/2024.
//
import Foundation

final class ApiClient {

    enum Error: Swift.Error {
        case invalidUrl
    }

    private static let apiRootUrl = "https://api.unsplash.com"
    private static let apiClientId = "HlNqDjq9eUonkbAFejQDXxljyBiduR9RIb5gWsAwxds"

    enum Route {
        case photos
        case statistics(photoId: String)
        case userPhotos(username: String)
        case searchPhotos(query: String)

        var path: String {
            switch self {
            case .photos: return "/photos"
            case .statistics(let photoId): return "/photos/\(photoId)/statistics"
            case .userPhotos(let username): return "/users/\(username)/photos"
            case .searchPhotos(let query): return "/search/photos?query=\(query)"
            }
        }

        var full: String {
            return [ApiClient.apiRootUrl, path].joined()
        }
    }

    @Sendable
    func getPhotos() async throws -> [Photo] {
        return try await request(route: .photos)
    }

    @Sendable
    func getPhotosStatistics(_ photoId: String) async throws -> Photo.Statistics {
        return try await request(route: .statistics(photoId: photoId))
    }

    @Sendable
    func getUserPhotos(_ username: String) async throws -> [Photo] {
        return try await request(route: .userPhotos(username: username))
    }

    @Sendable
    func searchPhotos(_ query: String) async throws -> SearchResults {
        return try await request(route: .searchPhotos(query: query))
    }

    @Sendable
    private func request<Model: Codable>(route: Route) async throws -> Model {
        guard let url = URL(string: route.full) else { throw Error.invalidUrl }
        var request = URLRequest(url: url)
        request.setValue("Client-ID \(Self.apiClientId)", forHTTPHeaderField: "Authorization")
        request.setValue("v1", forHTTPHeaderField: "Accept-Version")
        let (data, _) = try await URLSession.shared.data(for: request)
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        return try jsonDecoder.decode(Model.self, from: data)
    }
}
