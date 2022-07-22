//
//  UIImageView+.swift
//  Happic-iOS
//
//  Created by devxsby on 2022/07/16.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImage(with urlString: String) {
        let cache = ImageCache.default
        cache.retrieveImage(forKey: urlString, options: nil) { result in
            switch result {
            case .success(let value):
                if let image = value.image {
                    self.image = image
                } else {
                    guard let url = URL(string: urlString) else { return }
                    let resource = ImageResource(downloadURL: url, cacheKey: urlString)
                    self.kf.indicatorType = .activity
                    self.kf.setImage(with: resource, options: [.transition(.fade(1))])
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
