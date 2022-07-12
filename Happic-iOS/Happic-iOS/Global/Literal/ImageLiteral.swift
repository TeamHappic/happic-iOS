//
//  ImageLiteral.swift
//  Happic-iOS
//
//  Created by devxsby on 2022/07/12.
//

import UIKit

enum ImageLiteral {
//    static var btnAdd: UIImage { .load(named: "btnAdd")}
}

extension UIImage {
    static func load(named imageName: String) -> UIImage {
        guard let image = UIImage(named: imageName, in: nil, compatibleWith: nil) else {
            return UIImage()
        }
        image.accessibilityIdentifier = imageName
        return image
    }
    
    func resize(to size: CGSize) -> UIImage {
        let image = UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
        return image
    }
}
