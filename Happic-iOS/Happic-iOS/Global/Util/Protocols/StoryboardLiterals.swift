//
//  StoryboardLiterals.swift
//  Happic-iOS
//
//  Created by Zaid Kang on 2022/07/16.
//

import UIKit

enum Storyboards: String {
    case characterChooseView = "CharacterChooseView"
    case createCharacterView = "CreateCharacterView"
    case characterIntroduceView = "CharacterIntroduceView"
}

extension UIStoryboard {
    static func list(_ name: Storyboards) -> UIStoryboard {
        return UIStoryboard(name: name.rawValue, bundle: nil)
    }
}
