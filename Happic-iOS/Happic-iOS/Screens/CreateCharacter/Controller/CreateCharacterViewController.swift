
import UIKit

class CreateCharacterViewController: UIViewController , Storyboarded{

    
    @IBOutlet weak var bottomViewHeight: NSLayoutConstraint!
    
    
    static var storyboard: Storyboards = .createCharacterView
    @IBOutlet weak var recordLabel: UILabel!
    @IBOutlet weak var MoonUIView: UIView!
    @IBOutlet weak var CloudUIView: UIView!
    @IBOutlet weak var CharacterIntroduceUIView: UIView!
    @IBOutlet weak var MoonAndCloudUIView: UIView!
    @IBOutlet weak var chooseLabel: UILabel!
    
    let screenSize:CGRect = UIScreen.main.bounds
    
    override func viewDidLoad() {
          super.viewDidLoad()
        
        CharacterIntroduceUIView.frame.size.height = 0
        recordLabel.text = "해픽의 밤하늘에 \n 당신의 행복을 기록하세요 "
        recordLabel.numberOfLines = 0
        recordLabel.textColor = UIColor.purple
        recordLabel.textAlignment = .center          // 중앙 정렬.
        
        setTapGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
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
            self.CharacterIntroduceUIView.transform = CGAffineTransform(translationX: 0, y: -490)
        })

    }

    @objc
    private func scaleDownCreateCharacterView() {
        raiseCharacterIntroduceView()
        recordLabel.isHidden = true
        chooseLabel.text = "어떤 길잡이와 함께 하실래요?"
        UIView.animate(withDuration: 1.0) {
            let scale = CGAffineTransform(scaleX: 0.6, y: 0.6)
            let move = CGAffineTransform(translationX: 0, y: -200)
            let combine = scale.concatenating(move)
            self.MoonAndCloudUIView.transform = combine
            self.chooseLabel.transform = CGAffineTransform(translationX: 0, y: -150)
        }

    }

}
