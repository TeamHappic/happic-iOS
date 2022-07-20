//
//  AuthViewController.swift
//  Happic-iOS
//
//  Created by Zaid Kang on 2022/07/16.
//

import UIKit

class AuthViewController: UIViewController {
    
    // MARK: - @IBOutlet Properties
    @IBOutlet weak var startWithKakaoView: UIView!
    @IBOutlet weak var termsIntroduceLabel: UILabel!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setTapGesture()
    }
    
    // MARK: - Functions
    private func setTapGesture() {
        startWithKakaoView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(presentCharacterChooseViewController))
        startWithKakaoView.addGestureRecognizer(tap)
    }
    
    @objc private func presentCharacterChooseViewController() {
        let createCharacterStoryBoard = UIStoryboard(name: "CreateCharacterView", bundle: nil)
        let creatCharacterViewController = createCharacterStoryBoard.instantiateViewController(withIdentifier: "CreateCharacterViewController")
        self.navigationController?.pushViewController(creatCharacterViewController, animated: true)
    }
}
