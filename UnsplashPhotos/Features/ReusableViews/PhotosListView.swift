//
//  PhotosListView.swift
//  UnsplashPhotos
//
//  Created by Nicolas LELOUP on 05/11/2024.
//

import SwiftUI

struct PhotosListView: View {
    @Binding var photos: [Photo]
    @Binding var selectedPhoto: Photo?
    @Binding var error: Error?

    private(set) var captionProvider: (() -> String)?

    private let columns = [GridItem(.adaptive(minimum: 200), spacing: 24)]

    var body: some View {
        if photos.isEmpty {
            VStack(spacing: 24) {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 128)
                    .foregroundStyle(.secondary.opacity(0.5))

                Text(error?.localizedDescription ?? captionProvider?() ?? "No images to display")
                    .font(.caption)
                    .multilineTextAlignment(.center)
            }
            .padding(64)
        } else {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(photos) { photo in
                    ZStack {
                        PhotoImageView(photo: photo)
                            .clipShape(.rect(cornerRadius: 24))

                        VStack {
                            Spacer()
                            PhotoAuthorCaptionBox(
                                photo: photo,
                                limitingNumberOfLines: true
                            )
                            .padding(16)
                            .background(
                                .ultraThinMaterial,
                                in: RoundedRectangle(cornerRadius: 16)
                            )
                        }
                        .padding(16)
                    }
                    .shadow(radius: 5)
                    .onTapGesture {
                        selectedPhoto = photo
                    }
                }
            }
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
        }
    }
}

extension PhotosListView {
    func withCaption(_ captionProvider: @escaping () -> String) -> PhotosListView {
        var copy = self
        copy.captionProvider = captionProvider
        return copy
    }
}
