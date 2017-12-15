//
//  LGTM.swift
//  LGTMKit
//
//  Created by Daiki Matsudate on 2017/12/14.
//

import Foundation

struct LGTM: Codable {
    enum CodingKeys: String, CodingKey {
        case isDeleted = "isDeleted"
        case dataUrl = "dataUrl"
        case id = "id"
        case likes = "likes"
        case datastoreVersion = "datastoreVersion"
        case credits = "credits"
        case impressions = "impressions"
        case markdown = "markdown"
        case imageUrl = "imageUrl"
        case trackableImageUrl = "trackableImageUrl"
        case upvoteUrl = "upvoteUrl"
        case dislikes = "dislikes"
        case deleteUrl = "deleteUrl"
        case hash = "hash"
        case reportUrl = "reportUrl"
        case root = "root"
        case actualImageUrl = "actualImageUrl"
    }

    let isDeleted: Bool
    let dataUrl: String
    let id: Int
    let likes: Int
    let datastoreVersion: Int
    let credits: Int
    let impressions: Int
    let markdown: String
    let imageUrl: String
    let trackableImageUrl: String
    let upvoteUrl: String
    let dislikes: Int
    let deleteUrl: String
    let hash: String
    let reportUrl: String
    let root: String
    let actualImageUrl: String
}
