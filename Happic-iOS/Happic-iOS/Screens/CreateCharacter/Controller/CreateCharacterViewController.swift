import Foundation
import UIKit

class CreateCharacterViewController: UIViewController , Storyboarded{

    static var storyboard: Storyboards = .CreateCharacterView
    @IBOutlet weak var recordLabel: UILabel!
    @IBOutlet weak var MoonUIView: UIView!
    @IBOutlet weak var CloudUIView: UIView!
    
    override func viewDidLoad() {
          super.viewDidLoad()
        recordLabel.text = "해픽의 밤하늘에 \n 당신의 행복을 기록하세요 "
        recordLabel.numberOfLines = 0
        recordLabel.textColor = UIColor.purple
        setTapGesture()

    }


    private func setTapGesture() {
        MoonUIView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(presentCharacterChooseViewController))
        MoonUIView.addGestureRecognizer(tap)
        
        
        CloudUIView.isUserInteractionEnabled = true
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(presentCharacterChooseViewController))
        CloudUIView.addGestureRecognizer(tap)
    }

    @objc
    private func presentCharacterChooseViewController() {
//        let nextVC = CharacterChooseViewController.instantiate()
    }

}
