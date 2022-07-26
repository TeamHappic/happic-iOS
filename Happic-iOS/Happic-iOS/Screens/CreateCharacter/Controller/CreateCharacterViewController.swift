//
//  CreateCharacterViewController.swift
//  Happic-iOS
//
//  Created by Zaid Kang on 2022/07/20.
//

import UIKit

final class CreateCharacterViewController: UIViewController, Storyboarded {
    
    var accessToken: String = ""

    @IBOutlet weak var bottomViewHeight: NSLayoutConstraint!
    
    static var storyboard: Storyboards = .createCharacterView
    @IBOutlet weak var recordLabel: UILabel!
    @IBOutlet weak var MoonUIView: UIView!
    @IBOutlet weak var CloudUIView: UIView!
    @IBOutlet weak var CharacterIntroduceUIView: CharacterIntroduceView!
    @IBOutlet weak var MoonAndCloudUIView: UIView!
    @IBOutlet weak var chooseLabel: UILabel!
    
    @IBOutlet weak var moonImageView: UIImageView!
    @IBOutlet weak var cloudImageView: UIImageView!
    
    let screenSize: CGRect = UIScreen.main.bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bottomViewHeight.constant = 510.adjustedH
        setPurpleBackgroundColor()

        CharacterIntroduceUIView.delegate = self
        CharacterIntroduceUIView.frame.size.height = 0
        CharacterIntroduceUIView.isHidden = true
        recordLabel.text = "해픽의 밤하늘에 \n 당신의 행복을 기록하세요 "
        recordLabel.numberOfLines = 0
        recordLabel.font = UIFont.font(.pretendardMedium, ofSize: 14)
        recordLabel.textAlignment = .center
        
        MoonUIView.setDarkBlue()
        MoonUIView.clipsToBounds = true
        MoonUIView.layer.cornerRadius = 10
        MoonUIView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        
        CloudUIView.setDarkPurple()
        CloudUIView.clipsToBounds = true
        CloudUIView.layer.cornerRadius = 10
        CloudUIView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        
        setTapGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }

    private func setTapGesture() {
        MoonUIView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(scaleDownCreateCharacterView(sender:)))
        MoonUIView.addGestureRecognizer(tap)
        /*
         CreateIntroduceView 에 Flag 0 을 전달
         MoonUIView 에 하이라이트
        */
        MoonUIView.layer.borderColor = UIColor.hpDarkPurple.cgColor
        
        CloudUIView.isUserInteractionEnabled = true
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(scaleDownCreateCharacterView(sender:)))
        CloudUIView.addGestureRecognizer(tap2)
        CloudUIView.layer.borderColor = UIColor.hpDarkPurple.cgColor

    }

    @objc
    private func raiseCharacterIntroduceView() {
        UIView.animate(withDuration: 1.0, animations: { [self] in
            self.CharacterIntroduceUIView.transform = CGAffineTransform(translationX: 0, y: -510)
        })

    }

    @objc
    private func scaleDownCreateCharacterView(sender: UITapGestureRecognizer) {
        if let tag = sender.view?.tag {
            CharacterIntroduceUIView.mooonCloudFlag = tag
        }
        if CharacterIntroduceUIView.mooonCloudFlag == 0 {
            MoonUIView.layer.borderColor = UIColor.hpDarkBlue.cgColor
            MoonUIView.layer.borderWidth = 2
            CloudUIView.layer.borderWidth = 0
        } else {
            CloudUIView.layer.borderColor = UIColor.hpDarkPurple.cgColor
            CloudUIView.layer.borderWidth = 2
            MoonUIView.layer.borderWidth = 0
        }
        raiseCharacterIntroduceView()
        self.CharacterIntroduceUIView.isHidden=false
        recordLabel.isHidden = true
        chooseLabel.text = "어떤 길잡이와 함께 하실래요?"
        UIView.animate(withDuration: 1.0) {
            let scale = CGAffineTransform(scaleX: 0.6, y: 0.6)
            let move = CGAffineTransform(translationX: 0, y: -230)
            let combine = scale.concatenating(move)
            self.MoonAndCloudUIView.transform = combine
            self.chooseLabel.transform = CGAffineTransform(translationX: 0, y: -180)
        }

    }

}

extension CreateCharacterViewController: CharacterIntroduceViewDelegate {
    func pushCharaterNameController(flag: Int) {
        let characterNameStoryBoard = UIStoryboard(name: "CharacterNameView", bundle: nil)
        guard let characterNameViewController = characterNameStoryBoard.instantiateViewController(withIdentifier: "CharacterNameViewController") as? CharacterNameViewController else { return }
        characterNameViewController.flag = flag
        self.navigationController?.pushViewController(characterNameViewController, animated: true)
        characterNameViewController.accessToken = accessToken
    }
}
