//
//  PhotoAuthorCaptionBox.swift
//  UnsplashPhotos
//
//  Created by Nicolas LELOUP on 05/11/2024.
//

import SwiftUI

struct PhotoAuthorCaptionBox: View {
    var photo: Photo
    var limitingNumberOfLines = false

    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 16) {
                AsyncImage(url: URL(string: photo.user.profileImage.medium)) { image in
                    image.resizable().scaledToFit()
                        .frame(width: 48, height: 48)
                        .clipShape(.circle)
                } placeholder: {
                    // TODO
                }

                VStack(alignment: .leading) {
                    Text(photo.user.name)
                        .foregroundStyle(.primary)
                        .font(.headline)
                    Text("\(photo.likes) likes")
                        .foregroundStyle(.primary)
                        .font(.subheadline)
                }

                Spacer()
            }

            if let description = photo.description {
                Divider()

                Text(description)
                    .lineLimit(limitingNumberOfLines ? 2 : .max)
                    .foregroundStyle(.secondary)
                    .font(.caption)
                    .frame(maxWidth: .infinity, alignment: .leading)

            }
        }
    }
}

#Preview {
    PhotoAuthorCaptionBox(photo: .random())
}
