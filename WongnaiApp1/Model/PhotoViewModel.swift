//
//  PhotoViewModel.swift
//  WongnaiApp1
//
//  Created by Navathon Limamapar on 26/3/2567 BE.
//

import Foundation

//MARK: - PhotoviewModel
class PhotoViewModel {
    var imageUrl: String?
    var name: String?
    var description: String?
    var votesCount: Int?
    
    init(photo: Photo) {
        imageUrl = photo.imageUrl?.first
        name = photo.name
        description = photo.description
        votesCount = photo.votesCount
    }
}
