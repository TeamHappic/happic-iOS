//
//  Storyboarded.swift
//  Happic-iOS
//
//  Created by Zaid Kang on 2022/07/16.
//

import UIKit

protocol Storyboarded {
    static var storyboard: Storyboards { get }
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        let identifier = String(describing: self)
        let uiStoryboard = UIStoryboard(name: self.storyboard.rawValue, bundle: nil)
        guard let vc = uiStoryboard.instantiateViewController(withIdentifier: identifier) as? Self else {
            fatalError("Could not find View Controller named \(identifier)")
        }
        return vc
    }
}
