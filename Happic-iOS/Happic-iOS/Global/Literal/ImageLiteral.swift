//
//  ImageLiteral.swift
//  Happic-iOS
//
//  Created by devxsby on 2022/07/12.
//

import UIKit

enum ImageLiteral {
    static var icnAddPhoto: UIImage { .load(named: "icn_addphoto")}
    static var icnArrowMore: UIImage { .load(named: "icn_arrow_more")}
    
    static var imageDailySample1: UIImage { .load(named: "image_daily_sample1")}
    static var imageDailySample2: UIImage { .load(named: "image_daily_sample2")}
    static var imageDailySample3: UIImage { .load(named: "image_daily_sample3")}
    static var imageDailySample4: UIImage { .load(named: "image_daily_sample4")}
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
