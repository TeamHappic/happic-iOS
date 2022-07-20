//
//  CharacterInroduceViewController.swift
//  Happic-iOS
//
//  Created by Zaid Kang on 2022/07/17.
//

import UIKit

class CharacterIntroduceView: UIView {
    
    
    static func instanceFromNib() -> UIView {
        // swiftlint:disable:next force_cast
        return UINib(nibName: "CharacterIntroduceView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }

    override class func awakeFromNib() {
        super.awakeFromNib()
        print("hi")
    }
}
