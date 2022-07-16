//
//  AuthViewController.swift
//  Happic-iOS
//
//  Created by Zaid Kang on 2022/07/16.
//

import Foundation
import UIKit

class AuthViewController: UIViewController {

    @IBOutlet weak var startWithKakao: UIView!
    @IBOutlet weak var termsIntroduceLabel: UILabel!
    
    override func viewDidLoad() {
          super.viewDidLoad()
          // Do any additional setup after loading the view, typically from a nib.
          
        // BackGround Color -- R, G, B, Alpha
        startWithKakao.layer.cornerRadius = 8
        startWithKakao.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        setTapGesture()
        
        let wholeStr = "로그인 시 이용약관과 개인정보 처리 방침에 동의하게 됩니다. "
        let rangeToUnderLine = (wholeStr as NSString).range(of: "이용약관")
        let rangeToUnderLine2 = (wholeStr as NSString).range(of: "개인정보 처리 방침")

        let underLineTxt = NSMutableAttributedString(string: wholeStr, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10), NSAttributedString.Key.foregroundColor: UIColor(displayP3Red: 230/255, green: 230/155, blue: 230/255, alpha: 148/255)])

        underLineTxt.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: rangeToUnderLine)
        termsIntroduceLabel.attributedText = underLineTxt
        
        let underLineTxt2 = NSMutableAttributedString(string: wholeStr, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10), NSAttributedString.Key.foregroundColor: UIColor(displayP3Red: 230/255, green: 230/155, blue: 230/255, alpha: 148/255)])

        underLineTxt.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: rangeToUnderLine2)
        termsIntroduceLabel.attributedText = underLineTxt

  }
    
    private func setTapGesture() {
        startWithKakao.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(presentCharacterChooseViewController))
        startWithKakao.addGestureRecognizer(tap)
    }

    @objc
    private func presentCharacterChooseViewController() {
//        let nextVC = CharacterChooseViewController.instantiate()
//        self.navigationController?.pushViewController(nextVC, animated: true)
        print("test")
    }

}
