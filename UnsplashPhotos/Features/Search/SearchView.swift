//
//  SearchView.swift
//  UnsplashPhotos
//
//  Created by Nicolas LELOUP on 05/11/2024.
//

import SwiftUI

struct SearchView: View {
    @Environment(\.searchPhotosRepository) var searchPhotosRepository

    @State private var photos: [Photo] = []
    @State private var selectedPhoto: Photo?
    @State private var query: String = ""
    @State private var error: Error?

    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                PhotosListView(photos: $photos, selectedPhoto: $selectedPhoto, error: $error)
                    .withCaption { "Start typing in anything you want to look for in above search bar" }
                    .searchable(text: $query, prompt: "Dogs, cars...")
                    .sheet(item: $selectedPhoto) { photo in
                        PhotoView(photo: photo)
                    }
                    .onSubmit(of: .search) {
                        Task {
                            self.error = nil
                            do {
                                photos = try await searchPhotosRepository.searchPhotos(query).results
                            } catch {
                                self.error = error
                                photos = []
                            }
                        }
                    }
            }
        }
    }
}

#Preview {
    SearchView()
        .environment(\.searchPhotosRepository, .mock)
}
