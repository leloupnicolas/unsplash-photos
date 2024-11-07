//
//  UnsplashPhotosApp.swift
//  UnsplashPhotos
//
//  Created by Nicolas LELOUP on 05/11/2024.
//

import SwiftUI

@main
struct UnsplashPhotosApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                TodayView().tabItem {
                    Image(systemName: "photo.stack")
                    Text("Today")
                }
                SearchView().tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            }
        }
    }
}
