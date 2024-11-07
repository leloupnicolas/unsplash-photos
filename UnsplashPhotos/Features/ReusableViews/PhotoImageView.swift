//
//  PhotoImageView.swift
//  UnsplashPhotos
//
//  Created by Nicolas LELOUP on 05/11/2024.
//

import SwiftUI

struct PhotoImageView: View {
    var photo: Photo
    var url: KeyPath<Photo.Urls, String> = \.small
    var contentMode: ContentMode = .fit

    var body: some View {
        AsyncImage(url: URL(string: photo.urls[keyPath: url])) { image in
            image.resizable().aspectRatio(contentMode: contentMode)
        } placeholder: {
            ZStack {
                Rectangle()
                    .fill(.secondary.opacity(0.10))
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 64)
                    .foregroundStyle(.secondary.opacity(0.20))
            }
            .aspectRatio(1, contentMode: .fit)
            .frame(maxWidth: .infinity, minHeight: 256)
        }
    }
}

#Preview {
    PhotoImageView(photo: .random())
}
