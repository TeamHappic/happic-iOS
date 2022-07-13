//
//  CustomTabPagerButton.swift
//  Happic-iOS
//
//  Created by sejin on 2022/07/13.
//

import UIKit
import Tabman

class CustomTabPagerButton: Tabman.TMLabelBarButton {
    override func update(for selectionState: TMBarButton.SelectionState) {
        switch selectionState {
        case .selected:
            backgroundColor = .black
        default:
            backgroundColor = UIColor.hpGray9
        }
        super.update(for: selectionState)
    }
}
