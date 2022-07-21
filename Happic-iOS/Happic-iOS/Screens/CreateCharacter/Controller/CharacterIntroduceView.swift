//
//  CharacterIntroduceView.swift
//  Happic-iOS
//
//  Created by Zaid Kang on 2022/07/20.
//

import UIKit

protocol CharacterIntroduceViewDelegate: AnyObject {
    func pushCharaterNameController(flag: Int)
}

class CharacterIntroduceView: UIView {
    
    weak var delegate: CharacterIntroduceViewDelegate?
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var firstAnswerLabel: UILabel!
    @IBOutlet weak var secondAnswerLabel: UILabel!
    @IBOutlet weak var thirdQuestionLabel: UILabel!
    @IBOutlet weak var thirdAnswerLabel: UILabel!
    @IBAction func continueDidTap(_ sender: Any) {
        delegate?.pushCharaterNameController(flag: mooonCloudFlag)
    }
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var thirdAnswerLabelWidth: NSLayoutConstraint!
    @IBOutlet weak var secondAnswerLabelWidth: NSLayoutConstraint!
    @IBOutlet weak var firstAnswerLabelWidth: NSLayoutConstraint!
    
    var mooonCloudFlag: Int = 0 {
        didSet {
            changeView(flag: mooonCloudFlag)
        }
    }

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
    
    func changeView(flag: Int) {
        if flag == 0 {
            firstAnswerLabel.text = "내가 좋아하는 사람들이 행복하다고 말하는거!!"
            firstAnswerLabelWidth.constant = 295
            firstAnswerLabel.textAlignment = .center
            firstAnswerLabel.font = UIFont.font(.pretendardBold, ofSize: 14)
            firstAnswerLabel.clipsToBounds = true
            firstAnswerLabel.layer.cornerRadius = 8
            firstAnswerLabel.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner]

            
            secondAnswerLabel.text = "조용히 일기에 걱정거리를 적어"
            secondAnswerLabelWidth.constant = 209
            secondAnswerLabel.textAlignment = .center
            secondAnswerLabel.font = UIFont.font(.pretendardBold, ofSize: 14)
            secondAnswerLabel.clipsToBounds = true
            secondAnswerLabel.layer.cornerRadius = 8
            secondAnswerLabel.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner]

            
            thirdQuestionLabel.text = "Q. 고마울 때 어떻게 표현해?"

            thirdAnswerLabel.text = "친구의 이야기를 충분히 다 들어봐"
            thirdAnswerLabelWidth.constant = 224
            thirdAnswerLabel.textAlignment = .center
            thirdAnswerLabel.font = UIFont.font(.pretendardBold, ofSize: 14)
            thirdAnswerLabel.clipsToBounds = true
            thirdAnswerLabel.layer.cornerRadius = 8
            thirdAnswerLabel.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner]

            continueButton.setTitle("함께하기", for: .normal)
            continueButton.setTitleColor(UIColor.white, for: .normal)
            continueButton.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
            continueButton.layer.cornerRadius = 8
            continueButton.layer.maskedCorners = [.layerMinXMinYCorner,.layerMinXMaxYCorner,.layerMaxXMinYCorner,.layerMaxXMaxYCorner]

        } else {
            //cloudVersion Label 변경
            firstAnswerLabel.text = "내가 한 일이 완벽하게 끝나는거!"
            firstAnswerLabelWidth.constant = 217
            firstAnswerLabel.textAlignment = .center
            firstAnswerLabel.font = UIFont.font(.pretendardBold, ofSize: 14)
            firstAnswerLabel.clipsToBounds = true
            firstAnswerLabel.layer.cornerRadius = 8
            firstAnswerLabel.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner]
            
            secondAnswerLabel.text = "걱정해서 뭐하지라고 생각하면서 그냥 잊어!"
            secondAnswerLabelWidth.constant = 274
            secondAnswerLabel.textAlignment = .center
            secondAnswerLabel.font = UIFont.font(.pretendardBold, ofSize: 14)
            secondAnswerLabel.clipsToBounds = true
            secondAnswerLabel.layer.cornerRadius = 8
            secondAnswerLabel.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner]

            
            thirdQuestionLabel.text = "Q. 위로는 어떻게 해줘?"
            
            thirdAnswerLabel.text = "친구의 이야기를 충분히 다 들어봐"
            thirdAnswerLabelWidth.constant = 224
            thirdAnswerLabel.textAlignment = .center
            thirdAnswerLabel.font = UIFont.font(.pretendardBold, ofSize: 14)
            thirdAnswerLabel.clipsToBounds = true
            thirdAnswerLabel.layer.cornerRadius = 8
            thirdAnswerLabel.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner]
            

            continueButton.setTitle("함께하기", for: .normal)
            continueButton.setTitleColor(UIColor.white, for: .normal)
            continueButton.backgroundColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
            continueButton.layer.cornerRadius = 8
            continueButton.layer.maskedCorners = [.layerMinXMinYCorner,.layerMinXMaxYCorner,.layerMaxXMinYCorner,.layerMaxXMaxYCorner]
            
        }
    }
}
