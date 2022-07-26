//
//  CharacterNameViewController.swift
//  Happic-iOS
//
//  Created by Zaid Kang on 2022/07/20.
//

import UIKit

final class CharacterNameViewController: UIViewController {
    
    var accessToken: String = ""

    @IBOutlet weak var characterImage: UIImageView!
    @IBAction func completeButtonDidTap(_ sender: Any) {
        guard let userName = characterNameTextField.text else {
            return
        }
        
        if let name = characterNameTextField.text {
            signUp(characterId: flag, characterName: name, accessToken: accessToken)
//            changeCharacter(characterId: flag, characterName: name)
        }
        
        namingCharacterLabel.text = "당신의 \(userName) 이(가) 오고 있어요 \n 잠시 기다려주세요"
        namingCharacterLabel.numberOfLines = 0
        namingCharacterLabel.textAlignment = .center

        let attributedStr = NSMutableAttributedString(string: namingCharacterLabel.text!)
        
        attributedStr.addAttribute(.foregroundColor, value: UIColor.orange, range: (namingCharacterLabel.text! as NSString).range(of: userName))
        
        namingCharacterLabel.attributedText = attributedStr
        
        self.dismiss(animated: true)
    }
    
    @IBAction func backButtonDidTap(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBOutlet weak var completeButton: UIButton!
    
    @IBOutlet weak var characterNameTextField: UITextField!
    @IBOutlet weak var characterImageUIView: UIView!
    @IBOutlet weak var namingCharacterLabel: UILabel!
    
    var flag: Int = 0 {
        didSet {
            print(flag)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPurpleBackgroundColor()
        if flag == 0 {
            characterImage.image = UIImage(named: "hp_img_m1")
            characterImageUIView.setDarkBlue()
            characterImageUIView.clipsToBounds = true
        } else {
            characterImage.image = UIImage(named: "hp_img_c1")
            characterImageUIView.setDarkPurple()
            characterImageUIView.clipsToBounds = true
        }
        characterImageUIView.layer.cornerRadius = 8
        characterImageUIView.layer.maskedCorners = [.layerMinXMinYCorner,
                                                    .layerMinXMaxYCorner,
                                                    .layerMaxXMinYCorner,
                                                    .layerMaxXMaxYCorner]
        completeButton.isEnabled = false
        completeButton.setAttributedTitle(NSAttributedString(string: "완료", attributes: [.font: UIFont.font(.pretendardBold, ofSize: 16), .foregroundColor: UIColor.hpWhite]), for: .normal)
        characterNameTextField.delegate = self
        characterNameTextField.becomeFirstResponder()
    }
    
    @IBAction func textFieldIsEditing(_ sender: UITextField) {
        if sender.hasText {
            completeButton.isEnabled = true
            completeButton.setAttributedTitle(NSAttributedString(string: "완료", attributes: [.font: UIFont.font(.pretendardBold, ofSize: 16), .foregroundColor: UIColor.hpWhite]), for: .normal)        } else {
                completeButton.isEnabled = false
                completeButton.setAttributedTitle(NSAttributedString(string: "완료", attributes: [.font: UIFont.font(.pretendardBold, ofSize: 16), .foregroundColor: UIColor.hpGray7]), for: .normal)        }
    }
    
}

extension CharacterNameViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let char = string.cString(using: String.Encoding.utf8) {
            let isBackSpace = strcmp(char, "\\b")
            if isBackSpace == -92 {
                return true
            }
        }
        guard let text = textField.text else { return false }
        if text.count >= 5 {
            showToast(message: "5글자 이내로 입력해주세요", yInsetFromSuperView: Int(370.adjustedH))
            return false
        }
        if string == " " { return false }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

// MARK: - Network
extension CharacterNameViewController {
    func signUp(characterId: Int, characterName: String, accessToken: String) {
        SignUpService.shared.signUp(social: "kakao",
                                    characterId: characterId,
                                    characterName: characterName,
                                    accessToken: accessToken) { response in
            switch response {
            case .success(let result):
                guard let data = result as? SignUpModel else { return }
                print("signup success", data)
            default:
                print(response)
            }
        }
    }
    
    func changeCharacter(characterId: Int, characterName: String) {
        SignUpService.shared.changeCharacter(characterId: characterId, characterName: characterName) { response in
            switch response {
            case .success:
                print("change character name success")
            default:
                print(response)
            }
        }
    }
}
