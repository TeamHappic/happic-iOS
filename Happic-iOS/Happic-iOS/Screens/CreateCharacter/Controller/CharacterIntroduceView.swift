//
//  CharacterIntroduceView.swift
//  Happic-iOS
//
//  Created by Zaid Kang on 2022/07/20.
//

import UIKit

class CharacterIntroduceView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var firstAnswerLabel: UILabel!
    @IBOutlet weak var secondAnswerLabel: UILabel!
    @IBOutlet weak var thirdQuestionLabel: UILabel!
    @IBOutlet weak var thirdAnswerLabel: UILabel!
    @IBAction func continueDidTap(_ sender: Any) {
    }
    @IBOutlet weak var continueButton: UIButton!
    
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
        //여기서 if 문 분기처리를 통해서 moonUI이면 label 이름 밑 버튼 색상 조정
    }
    
    func changeView(flag: Int) {
        if flag == 0 {
            //moonVersion Label 변경
            firstAnswerLabel.text = "내가 좋아하는 사람들이 행복하다고 말하는거!!"
            secondAnswerLabel.text = "조용히 일기에 걱정거리를 적어"
            thirdQuestionLabel.text = "고마울 때 어떻게 표현해?"
            thirdAnswerLabel.text = "친구의 이야기를 충분히 다 들어봐"
            continueButton.setTitle("함께하기", for: .normal)
            continueButton.setTitleColor(UIColor.white, for: .normal)
            continueButton.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
            continueButton.layer.cornerRadius = 8
            continueButton.layer.maskedCorners = [.layerMinXMinYCorner,.layerMinXMaxYCorner,.layerMaxXMinYCorner,.layerMaxXMaxYCorner]


        }else {
            //cloudVersion Label 변경
            firstAnswerLabel.text = "내가 한 일이 완벽하게 끝나는거!"
            secondAnswerLabel.text = "걱정해서 뭐하지라고 생각하면서 그냥 잊어!"
            thirdQuestionLabel.text = "위로는 어떻게 해줘?"
            thirdAnswerLabel.text = "친구의 이야기를 충분히 다 들어봐"
            continueButton.setTitle("함께하기", for: .normal)
            continueButton.setTitleColor(UIColor.white, for: .normal)
            continueButton.backgroundColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
            continueButton.layer.cornerRadius = 8
            continueButton.layer.maskedCorners = [.layerMinXMinYCorner,.layerMinXMaxYCorner,.layerMaxXMinYCorner,.layerMaxXMaxYCorner]
            
      
        }
    }
}
