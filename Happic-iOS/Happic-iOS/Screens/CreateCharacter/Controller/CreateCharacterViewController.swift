
import UIKit

class CreateCharacterViewController: UIViewController , Storyboarded{

    
    @IBOutlet weak var bottomViewHeight: NSLayoutConstraint!
    
    
    
    
    static var storyboard: Storyboards = .CreateCharacterView
    @IBOutlet weak var recordLabel: UILabel!
    @IBOutlet weak var MoonUIView: UIView!
    @IBOutlet weak var CloudUIView: UIView!
    @IBOutlet weak var CharacterIntroduceUIView: UIView!
    @IBOutlet weak var MoonAndCloudUIView: UIView!
    
    let screenSize:CGRect = UIScreen.main.bounds
    
    override func viewDidLoad() {
          super.viewDidLoad()
        CharacterIntroduceUIView.frame.size.height = 0
        recordLabel.text = "해픽의 밤하늘에 \n 당신의 행복을 기록하세요 "
        recordLabel.numberOfLines = 0
        recordLabel.textColor = UIColor.purple
        //self.CharacterIntroduceUIView.transform = CGAffineTransform(translationX: 0, y: -200)
        
        setTapGesture()
     

    }


    private func setTapGesture() {
        MoonUIView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(scaleDownCreateCharacterView))
        MoonUIView.addGestureRecognizer(tap)
        
        
        CloudUIView.isUserInteractionEnabled = true
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(scaleDownCreateCharacterView))
        CloudUIView.addGestureRecognizer(tap2)
    }

//    @objc
//    private func presentCharacterChooseViewController() {
////        let nextVC = CharacterChooseViewController.instantiate()
//    }
//
    @objc
    private func raiseCharacterIntroduceView() {
        UIView.animate(withDuration: 1.0, animations: { [self] in
            self.CharacterIntroduceUIView.transform = CGAffineTransform(translationX: 0, y: -510)
        })

    }
    
    @objc
    private func raiseCharacterChooseView() {
        UIView.animate(withDuration: 1.0, animations: { [self] in
            self.CharacterIntroduceUIView.transform = CGAffineTransform(translationX: 0, y: -310)
        })
    }
//
    

    
    @objc
    private func scaleDownCreateCharacterView() {
        raiseCharacterIntroduceView()
        raiseCharacterChooseView()
        UIView.animate(withDuration: 1.0, animations: {
            self.MoonAndCloudUIView.transform = CGAffineTransform(scaleX: 0.4, y: 0.4)
        } , completion: { _ in UIView.animate(withDuration: 1.0){
            self.MoonAndCloudUIView.transform = CGAffineTransform(scaleX: 0.4, y: 0.4)
        }
        }
        
        )
    }

}
