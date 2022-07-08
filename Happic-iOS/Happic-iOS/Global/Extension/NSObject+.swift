//
//  NSObject+.swift
//  Happic-iOS
//
//  Created by sejin on 2022/07/09.
//

import Foundation

extension NSObject {
    static var className: String {
        return String(describing: self)
    }
}
