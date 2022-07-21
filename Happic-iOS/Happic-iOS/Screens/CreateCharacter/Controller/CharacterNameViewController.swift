import UIKit

class CharacterNameViewController: UIViewController{
    @IBOutlet weak var characterImage: UIImageView!
    @IBAction func completeButtonDidTap(_ sender: Any) {
        
    }
    @IBAction func backButtonDidTap(_ sender: Any) {
        
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
    
    
    
    /*
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
     */
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
