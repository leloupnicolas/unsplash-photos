//
//  Photo+Mock.swift
//  UnsplashPhotos
//
//  Created by Nicolas LELOUP on 05/11/2024.
//
import Foundation

extension String {
    static func randomDescription() -> String {
        let sentences = [
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            "Sed non risus.",
            "Suspendisse lectus tortor, dignissim sit amet.",
            "Adipiscing nec, ultricies sed, dolor."
        ]

        return sentences.shuffled()
            .prefix(Int.random(in: 1...(sentences.count)))
            .joined(separator: " ")
    }
}

extension Photo {
    static func random() -> Photo {
        Photo(
            id: UUID().uuidString,
            description: .randomDescription(),
            likes: Int.random(in: 10...1000),
            user: .random,
            urls: .random
        )
    }
}

extension Photo.Author {
    static var random: Photo.Author = Photo.Author(
        id: UUID().uuidString,
        name: "Nicolas",
        username: "leloupnicolas",
        profileImage: ProfileImage(
            small: "https://images.unsplash.com/profile-1602741027167-c4d707fcfc85image?ixlib=rb-4.0.3&crop=faces&fit=crop&w=32&h=32",
            medium: "https://images.unsplash.com/profile-1602741027167-c4d707fcfc85image?ixlib=rb-4.0.3&crop=faces&fit=crop&w=64&h=64"
        )
    )
}

extension Photo.Urls {
    static var random: Photo.Urls = Photo.Urls(
        small: "",//"https://images.unsplash.com/photo-1721332155433-3a4b5446bcd9?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w2NzIxOTJ8MXwxfGFsbHwxfHx8fHx8fHwxNzMwODA3MzA0fA&ixlib=rb-4.0.3&q=80&w=400",
        thumb: "https://images.unsplash.com/photo-1721332155433-3a4b5446bcd9?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w2NzIxOTJ8MXwxfGFsbHwxfHx8fHx8fHwxNzMwODA3MzA0fA&ixlib=rb-4.0.3&q=80&w=200"
    )
}
