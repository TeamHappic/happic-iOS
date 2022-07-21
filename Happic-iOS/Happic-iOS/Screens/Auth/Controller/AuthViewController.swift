//
//  AuthViewController.swift
//  Happic-iOS
//
//  Created by Zaid Kang on 2022/07/16.
//

import UIKit
import KakaoSDKAuth
import KakaoSDKUser

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
    
    // TO DO : 함수 이름 바꾸기
    @objc private func presentCharacterChooseViewController() {
        let createCharacterStoryBoard = UIStoryboard(name: "CreateCharacterView", bundle: nil)
        let creatCharacterViewController = createCharacterStoryBoard.instantiateViewController(withIdentifier: "CreateCharacterViewController")
        self.navigationController?.pushViewController(creatCharacterViewController, animated: true)

        loginWithKakao()
    }
    
    private func loginWithKakao() {
        // 카카오톡 로그인
        if UserApi.isKakaoTalkLoginAvailable() {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                } else {
                    print("loginWithKakaoTalk() success.")
                    if let accessToken = oauthToken?.accessToken {
                        print("\(accessToken)")
                    }
                }
            }
        } else {
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
               if let error = error {
                 print(error)
               } else {
                print("loginWithKakaoAccount() success.")
                   if let accessToken = oauthToken?.accessToken {
                       print("\(accessToken)")
                   }
               }
            }
        }
    }
}
