//
//  PhotoCell.swift
//  WongnaiApp1
//
//  Created by Navathon Limamapar on 26/3/2567 BE.
//

import UIKit


class PhotoCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var votesCountLabel: UILabel!
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    private func setUpImageView() {
        photoImageView.layer.cornerRadius = 4
        photoImageView.clipsToBounds = true
    }
    
    // MARK: - Methods
    // Set the elements in the cell, use the info from the api.
    // For the image using Kingfisher library by func setImage.
    func configure(with viewModel: PhotoViewModel) {
        nameLabel.text = viewModel.name
        descriptionLabel.text = viewModel.description
        votesCountLabel.text = "\(viewModel.votesCount ?? 0)"
        
        if let imageUrl = viewModel.imageUrl {
            photoImageView.setImage(with: imageUrl)
        }
    }
}
