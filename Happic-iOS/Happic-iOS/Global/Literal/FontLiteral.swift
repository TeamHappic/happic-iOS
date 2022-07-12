//
//  FontLiteral.swift
//  Happic-iOS
//
//  Created by devxsby on 2022/07/12.
//

import UIKit

enum FontName: String {
    case gmarketSansBold = "GmarketSansBold"
    case pretendardBold = "Pretendard-Bold"
    case pretendardExtraBold = "Pretendard-ExtraBold"
    case pretendardMedium = "Pretendard-Medium"
    case pretendardRegular = "Pretendard-Regular"
}

extension UIFont {
    static func font(_ style: FontName, ofSize size: CGFloat) -> UIFont {
        return UIFont(name: style.rawValue, size: size)!
    }
}
