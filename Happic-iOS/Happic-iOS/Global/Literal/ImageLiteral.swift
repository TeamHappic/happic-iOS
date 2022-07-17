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
    static var icnArrowBack: UIImage { .load(named: "icn_arrow_back")}
    static var icnArrowNext: UIImage { .load(named: "icn_arrow_next")}
    
    static var imageDailySample1: UIImage { .load(named: "image_daily_sample1")}
    static var imageDailySample2: UIImage { .load(named: "image_daily_sample2")}
    static var imageDailySample3: UIImage { .load(named: "image_daily_sample3")}
    static var imageDailySample4: UIImage { .load(named: "image_daily_sample4")}
    
    static var icnChat: UIImage { .load(named: "icn_chat") }

    static var imageMoon: UIImage { .load(named: "image_moon")}
    static var imageCloud: UIImage { .load(named: "image_cloud")}
    
    static var icnAlarm: UIImage { .load(named: "icn_alarm") }
    
    static var icnCancel: UIImage { .load(named: "icn_cancel") }
    static var imageCapsule: UIImage { .load(named: "image_capsule") }
    static var imageBlnakPhoto: UIImage { .load(named: "image_blank_photo") }
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
