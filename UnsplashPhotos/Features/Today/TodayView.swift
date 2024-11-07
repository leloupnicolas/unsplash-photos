//
//  TodayView.swift
//  UnsplashPhotos
//
//  Created by Nicolas LELOUP on 05/11/2024.
//

import SwiftUI

struct TodayView: View {
    @Environment(\.feedPhotosRepository) var feedPhotosRepository

    @State private var photos: [Photo] = []
    @State private var selectedPhoto: Photo?
    @State private var error: Error?

    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                PhotosListView(photos: $photos, selectedPhoto: $selectedPhoto, error: $error)
                    .navigationBarTitleDisplayMode(.large)
                    .navigationTitle(Date.now.formatted(date: .long, time: .omitted))
                    .sheet(item: $selectedPhoto) { photo in
                        PhotoView(photo: photo)
                    }
            }
            .task { await load() }
            .refreshable { await load() }
        }
    }

    private func load() async {
        error = nil
        do {
            photos = try await feedPhotosRepository.getPhotos()
        } catch {
            self.error = error
            photos = []
        }
    }
}

#Preview {
    TodayView()
        .environment(\.feedPhotosRepository, .mock)
}
