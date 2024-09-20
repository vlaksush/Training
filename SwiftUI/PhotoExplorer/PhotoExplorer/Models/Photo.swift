//
//  Photo.swift
//  PhotoExplorer
//
//  Created by Ravi Shankar on 18/09/24.
//

import Foundation

struct Photo: Identifiable, Codable {
    let id: Int
    let pageURL: String
    let previewURL: String
    let largeImageURL: String
    let user: String
    let tags: String
}

struct PixabayResponse: Codable {
    let total: Int
    let totalHits: Int
    let hits: [Photo]
}
