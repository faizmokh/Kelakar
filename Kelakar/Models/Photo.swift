//
//  Photo.swift
//  Kelakar
//
//  Created by Faiz Mokhtar on 12/04/2020.
//  Copyright © 2020 Faiz Mokhtar. All rights reserved.
//

import Foundation

// MARK: - Photos
struct Photo: Codable {
    let id: String
    let width, height: Int
    let color: String
    let photosDescription: String?
    let altDescription: String
    let urls: Urls
    let categories: [String]
    let likes: Int
    let likedByUser: Bool
    let views, downloads: Int

    enum CodingKeys: String, CodingKey {
        case id
        case width, height, color
        case photosDescription = "description"
        case altDescription = "alt_description"
        case urls, categories, likes
        case likedByUser = "liked_by_user"
        case views, downloads
    }
}

// MARK: - Urls
struct Urls: Codable {
    let raw, full, regular, small: String
    let thumb: String
}
