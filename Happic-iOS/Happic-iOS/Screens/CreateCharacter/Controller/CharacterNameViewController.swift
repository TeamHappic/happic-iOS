//
//  CharacterNameViewController.swift
//  Happic-iOS
//
//  Created by Zaid Kang on 2022/07/20.
//

import UIKit

final class CharacterNameViewController: UIViewController {
    
    // MARK: - Properties
    var accessToken: String = ""
    var isSignUp: Bool = true
    private let userManager = UserManager.shared

    var flag: Int = 0
    
    // MARK: - @IBOutlet Properties
    @IBOutlet weak var characterImageUIView: UIView!
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterNameTextField: UITextField!
    @IBOutlet weak var namingCharacterLabel: UILabel!
    @IBOutlet weak var completeButton: UIButton! {
        didSet {
            completeButton.isEnabled = false
        }
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setDelegate()
    }
    
    // MARK: - @IBAction Properties
    @IBAction func completeButtonDidTap(_ sender: Any) {
                
        guard let userName = characterNameTextField.text else { return }
        
        if let name = characterNameTextField.text {
            if isSignUp {
                signUp(characterId: flag, characterName: name, accessToken: accessToken)
            }
            changeCharacter(characterId: flag, characterName: name)
        }
        
        namingCharacterLabel.text = "당신의 \(userName)이(가) 오고 있어요\n잠시 기다려주세요"
        
        let attributedStr = NSMutableAttributedString(string: namingCharacterLabel.text!)
        
        attributedStr.addAttribute(.foregroundColor, value: UIColor.orange, range: (namingCharacterLabel.text! as NSString).range(of: userName))
        
        namingCharacterLabel.attributedText = attributedStr
        
        characterNameTextField.resignFirstResponder()
        guard let previousViewController = self.presentingViewController else { return }
        self.dismiss(animated: true) {
            previousViewController.dismiss(animated: true)
        }
    }
    
    @IBAction func backButtonDidTap(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func textFieldIsEditing(_ sender: UITextField) {
        completeButton.isEnabled = sender.hasText
    }
    
    // MARK: - Functions
    private func configureUI() {
        
        setPurpleBackgroundColor()
        
        characterImageUIView.clipsToBounds = true
        
        if flag == 0 {
            characterImage.image = ImageLiterals.imageMoonLv1
            characterImageUIView.setDarkBlue()
        } else {
            characterImage.image = ImageLiterals.imageCloudLv1
            characterImageUIView.setDarkPurple()
        }
    }
    
    private func setDelegate() {
        characterNameTextField.delegate = self
    }
}

// MARK: - Extensions
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
        LoadingIndicator.showLoading()
        SignUpService.shared.signUp(social: "kakao",
                                    characterId: characterId,
                                    characterName: characterName,
                                    accessToken: accessToken) { response in
            switch response {
            case .success(let result):
                guard let data = result as? SignUpModel else { return }
                self.userManager.setSocialToken(token: data.jwtToken)
                LoadingIndicator.hideLoading()
                self.dismiss(animated: true)
            default:
                self.showAlert(title: "네트워크 오류로 인해\n데이터를 불러올 수 없습니다.\n다시 시도해 주세요.")
                print(response)
            }
        }
    }
    
    func changeCharacter(characterId: Int, characterName: String) {
        LoadingIndicator.showLoading()
        SignUpService.shared.changeCharacter(characterId: characterId, characterName: characterName) { response in
            switch response {
            case .success:
                LoadingIndicator.hideLoading()
                print("change character name success")
            default:
                self.showAlert(title: "네트워크 오류로 인해\n데이터를 불러올 수 없습니다.\n다시 시도해 주세요.")
                print(response)
            }
        }
    }
}
