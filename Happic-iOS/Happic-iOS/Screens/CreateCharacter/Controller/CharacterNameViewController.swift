import UIKit

class CharacterNameViewController: UIViewController{
    @IBOutlet weak var characterImage: UIImageView!
    @IBAction func completeButtonDidTap(_ sender: Any) {
//        navigationController?.pushViewController(<#T##viewController: UIViewController##UIViewController#>, animated: true)
    }
    @IBAction func backButtonDidTap(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBOutlet weak var completeButton: UIButton!
    
    @IBOutlet weak var characterNameTextField: UITextField!
    
    var flag: Int = 0 {
        didSet {
            print(flag)
        }
    }

    override func viewDidLoad() {
          super.viewDidLoad()
        if flag == 0 {
            characterImage.image=UIImage(named:"hp_img_m1")
        }
        else {
            characterImage.image=UIImage(named:"hp_img_c1")
        }
        completeButton.isEnabled = false
        completeButton.setTitleColor(UIColor.hpGray7, for: .normal)
        
        
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
