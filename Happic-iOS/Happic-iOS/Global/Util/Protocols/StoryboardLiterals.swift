//
//  StoryboardLiterals.swift
//  Happic-iOS
//
//  Created by Zaid Kang on 2022/07/16.
//

import Foundation
import UIKit

enum Storyboards: String {
    case CharacterChooseView = "CharacterChooseView"
    case CreateCharacterView = "CreateCharacterView"

}

extension UIStoryboard{
    static func list(_ name : Storyboards) -> UIStoryboard{
        return UIStoryboard(name: name.rawValue, bundle: nil)
    }
}

