//
//  UIImageView+Extension.swift
//  WongnaiApp1
//
//  Created by Navathon Limamapar on 26/3/2567 BE.
//

// MARK: - UIImageView Extensions
import UIKit
import Kingfisher


extension UIImageView {
    func setImage(with urlString: String) {
        guard let url = URL.init(string: urlString) else {
            return
        }
        let resource = KF.ImageResource(downloadURL: url, cacheKey: urlString)
        kf.indicatorType = .activity
        kf.setImage(with: resource)
    }
}
