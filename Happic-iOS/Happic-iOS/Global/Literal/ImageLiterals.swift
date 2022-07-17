//
//  ImageLiterals.swift
//  Happic-iOS
//
//  Created by devxsby on 2022/07/12.
//

import UIKit

enum ImageLiterals {

    static var bgSplash: UIImage { .load(named: "bg_splash") }
    static var hpImageSplash: UIImage { .load(named: "hp_image_splash") }
    
    static var icnKakao: UIImage { .load(named: "hp_ic_kakao")}
    static var icnAlert: UIImage { .load(named: "hp_ic_alert")}
    static var icnTrash: UIImage { .load(named: "hp_ic_trash")}
    static var icnInfo: UIImage { .load(named: "hp_ic_info")}
    static var icnPlus: UIImage { .load(named: "hp_ic_plus")}
    static var icnLeft: UIImage { .load(named: "hp_ic_left")}
    static var icnRight: UIImage { .load(named: "hp_ic_right")}
    static var icnUp: UIImage { .load(named: "hp_ic_up")}
    static var icnDown: UIImage { .load(named: "hp_ic_down")}
    static var icnUpMini: UIImage { .load(named: "hp_ic_up_mini")}
    static var icnDownMini: UIImage { .load(named: "hp_ic_down_mini")}
    
    static var btnPlus: UIImage { .load(named: "hp_btn_plus") }
    
    static var imageCloudLv1: UIImage { .load(named: "hp_img_c1") }
    static var imageCloudLv2: UIImage { .load(named: "hp_img_c2") }
    static var imageCloudLv3: UIImage { .load(named: "hp_img_c3") }
    static var imageCloudLv4: UIImage { .load(named: "hp_img_c4") }
    static var imageMoonLv1: UIImage { .load(named: "hp_img_m1") }
    static var imageMoonLv2: UIImage { .load(named: "hp_img_m2") }
    static var imageMoonLv3: UIImage { .load(named: "hp_img_m3") }
    static var imageMoonLv4: UIImage { .load(named: "hp_img_m4") }

    static var imageStar: UIImage { .load(named: "hp_img_star") }
    
    static var imageEmpty: UIImage { .load(named: "hp_img_empty") }
    static var imageBlankPhoto: UIImage { .load(named: "image_blank_photo") }
    static var imageCapsule: UIImage { .load(named: "image_capsule") } /// 변경 예정

    // 샘플 이미지
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
