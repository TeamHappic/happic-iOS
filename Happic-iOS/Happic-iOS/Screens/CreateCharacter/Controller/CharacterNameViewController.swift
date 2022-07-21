import UIKit

class CharacterNameViewController: UIViewController{
    @IBOutlet weak var characterImage: UIImageView!
    @IBAction func completeButtonDidTap(_ sender: Any) {
        guard let userName = characterNameTextField.text else {
            return
        }
        namingCharacterLabel.text = "당신의 \(userName) 이(가) 오고 있어요 \n 잠시 기다려주세요"
        namingCharacterLabel.numberOfLines = 0
        namingCharacterLabel.textAlignment = .center

        
        let attributedStr = NSMutableAttributedString(string: namingCharacterLabel.text!)
        
        attributedStr.addAttribute(.foregroundColor, value: UIColor.orange, range: (namingCharacterLabel.text! as NSString).range(of: userName))
        
        namingCharacterLabel.attributedText = attributedStr
        
        
        
        
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
            characterImage.image=UIImage(named:"hp_img_m1")
        }
        else {
            characterImage.image=UIImage(named:"hp_img_c1")
        }
        characterImageUIView.layer.cornerRadius = 8
        characterImageUIView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMinXMaxYCorner,.layerMaxXMinYCorner,.layerMaxXMaxYCorner]
        completeButton.isEnabled = false
        completeButton.setTitleColor(UIColor.hpGray7, for: .normal)
        characterNameTextField.delegate = self
        
    }
    
    @IBAction func textFieldIsEditing(_ sender: UITextField) {
        if sender.hasText {
            completeButton.isEnabled = true
            completeButton.setTitleColor(UIColor.hpWhite, for: .normal)
        } else {
            completeButton.isEnabled = false
            completeButton.setTitleColor(UIColor.hpGray7, for: .normal)
        }
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
            return false
        }
        return true
    }
}
