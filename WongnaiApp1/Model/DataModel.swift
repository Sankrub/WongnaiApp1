//
//  DataModel.swift
//  WongnaiApp1
//
//  Created by Navathon Limamapar on 26/3/2567 BE.
//

import Foundation

// MARK: - Data Models
struct DataModel: Codable {
    //    let current_page: Int
    //    let total_pages: Int
    //    let total_items: Int
    //    let feature: String
    let photos: [Photo]
}

struct Photo: Codable {
    let imageUrl: [String]?
    let name: String?
    let description: String?
    let votesCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case imageUrl = "image_url"
        case name
        case description
        case votesCount = "votes_count"
    }
    
}
