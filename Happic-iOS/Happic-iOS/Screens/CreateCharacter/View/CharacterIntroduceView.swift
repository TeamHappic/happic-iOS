//
//  CharacterIntroduceView.swift
//  Happic-iOS
//
//  Created by Zaid Kang on 2022/07/20.
//

import UIKit

// MARK: - Protocols
protocol CharacterIntroduceViewDelegate: AnyObject {
    func pushCharaterNameController(flag: Int)
}

final class CharacterIntroduceView: UIView {
    
    // MARK: - Properties
    weak var delegate: CharacterIntroduceViewDelegate?
    var characterFlag: Int = 0 {
        didSet {
            changeView(flag: characterFlag)
        }
    }
    
    // MARK: - @IBOutlet Properties
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var firstAnswerLabel: UILabel!
    @IBOutlet weak var secondAnswerLabel: UILabel!
    @IBOutlet weak var thirdAnswerLabel: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var firstAnswerLabelWidth: NSLayoutConstraint!
    @IBOutlet weak var secondAnswerLabelWidth: NSLayoutConstraint!
    @IBOutlet weak var thirdAnswerLabelWidth: NSLayoutConstraint!
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubview()
    }
    
    // MARK: - @IBAction Properties
    @IBAction func continueDidTap(_ sender: Any) {
        delegate?.pushCharaterNameController(flag: characterFlag)
    }
    
    // MARK: - Functions
    private func initSubview() {
        let nib = UINib(nibName: "CharacterIntroduceView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
        
        [firstAnswerLabel, secondAnswerLabel, thirdAnswerLabel].forEach { UILabel in
            UILabel?.clipsToBounds = true
            UILabel?.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        }
    }
    
    private func changeView(flag: Int) {
        if flag == 0 {
            firstAnswerLabel.text = "내가 좋아하는 사람들이 행복하다고 말하는거!!"
            firstAnswerLabelWidth.constant = 296
            
            secondAnswerLabel.text = "조용히 일기에 걱정거리를 적어"
            secondAnswerLabelWidth.constant = 210
            
            thirdAnswerLabel.text = "나는 편지와 함께 고맙다고 말해!"
            thirdAnswerLabelWidth.constant = 224
            
            continueButton.backgroundColor = UIColor.hpDarkBlue
        } else {
            firstAnswerLabel.text = "내가 한 일이 완벽하게 끝나는거!"
            firstAnswerLabelWidth.constant = 216
            
            secondAnswerLabel.text = "걱정해서 뭐하지라고 생각하면서 그냥 잊어!"
            secondAnswerLabelWidth.constant = 274
            
            thirdAnswerLabel.text = "친구에게 맛있는 걸 사주면서 간접적으로 표현해!"
            thirdAnswerLabelWidth.constant = 304
            
            continueButton.backgroundColor = .hpDarkPurple
        }
    }
}
