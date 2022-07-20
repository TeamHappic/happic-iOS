//
//  CharacterIntroduceView.swift
//  Happic-iOS
//
//  Created by Zaid Kang on 2022/07/20.
//

import UIKit

class CharacterIntroduceView: UIView {
    
    @IBOutlet var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
    }

    func initSubviews() {
        let nib = UINib(nibName: "CharacterIntroduceView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        addSubviews(contentView)
    }
}
