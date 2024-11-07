//
//  Photo+Author.swift
//  UnsplashPhotos
//
//  Created by Nicolas LELOUP on 05/11/2024.
//

import Foundation

extension Photo {
    struct Author: Codable {
        struct ProfileImage: Codable {
            let small: String
            let medium: String
        }

        let id: String
        var name: String
        let username: String
        let profileImage: ProfileImage
    }
}
