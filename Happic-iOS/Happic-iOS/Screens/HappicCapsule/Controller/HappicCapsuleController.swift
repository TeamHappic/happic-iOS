//
//  HappicCapsuleController.swift
//  Happic-iOS
//
//  Created by sejin on 2022/07/08.
//

import UIKit

class HappicCapsuleController: UIViewController {
    
    // MARK: - UI
    private lazy var cancelButton = UIButton(type: .system).then {
        $0.setImage(ImageLiteral., for: <#T##UIControl.State#>)
    }
    
    
    private lazy var titleLabel = UILabel().then {
        $0.text = "해픽 캡슐"
        $0.textColor = .hpGray3
        $0.font = UIFont.font(.gmarketSansBold, ofSize: 20)
    }
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
