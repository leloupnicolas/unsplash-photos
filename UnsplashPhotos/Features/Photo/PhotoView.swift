//
//  PhotoView.swift
//  UnsplashPhotos
//
//  Created by Nicolas LELOUP on 05/11/2024.
//

import SwiftUI

struct PhotoView: View {
    @Environment(\.photoStatisticsRepository) var photoStatisticsRepository
    @Environment(\.userPhotosRepository) var userPhotosRepository

    var photo: Photo
    @State var statistics: Photo.Statistics?
    @State var userPhotos: [Photo] = []

    private let columns = [GridItem(.adaptive(minimum: 160), spacing: 8)]

    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                Capsule()
                    .foregroundStyle(.secondary)
                    .frame(width: 24, height: 6)

                Spacer().frame(height: 16)

                topImageBlock

                PhotoAuthorCaptionBox(photo: photo)
                    .padding(24)

                if !userPhotos.isEmpty {
                    Spacer().frame(height: 32)
                    VStack(spacing: 8) {
                        Text("Other posts from \(photo.user.name):")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0))
                        photosFromUser
                    }
                }
            }
            .padding(16)
            .ignoresSafeArea(.all)
        }
        .task {
            do {
                userPhotos = try await userPhotosRepository.getUserPhotos(photo.user.username)
                    .filter { $0.id != photo.id }
            } catch {
                userPhotos = []
            }
        }
    }

    @ViewBuilder var topImageBlock: some View {
        ZStack {
            PhotoImageView(photo: photo)
                .clipShape(.rect(cornerRadius: 16))

            if let statistics {
                VStack {
                    Spacer()

                    HStack(alignment: .center) {
                        Image(systemName: "eye")
                        Text("\(statistics.views.total)")
                        Spacer().frame(width: 16)
                        Divider().frame(height: 12)
                        Spacer().frame(width: 16)
                        Image(systemName: "photo.badge.arrow.down")
                        Text("\(statistics.downloads.total)")
                    }
                    .padding(16)
                    .background(.ultraThinMaterial, in: Capsule())

                    Spacer().frame(height: 24)
                }
            }
        }
        .task {
            statistics = try? await photoStatisticsRepository.getStatistics(photo.id)
        }
    }

    @ViewBuilder var photosFromUser: some View {
        LazyVGrid(columns: columns, spacing: 8) {
            ForEach(userPhotos) { photo in
                Rectangle()
                    .aspectRatio(1.0, contentMode: .fit)
                    .overlay(
                        PhotoImageView(
                            photo: photo,
                            url: \.thumb,
                            contentMode: .fill
                        )
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
        }
    }
}

#Preview {
    PhotoView(
        photo: .random(),
        statistics: .init(views: .random(), downloads: .random()),
        userPhotos: [
            .random(), .random(), .random(), .random()
        ]
    )
}
