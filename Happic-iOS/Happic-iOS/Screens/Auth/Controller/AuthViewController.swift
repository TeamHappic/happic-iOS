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
        let tap = UITapGestureRecognizer(target: self, action: #selector(loginButtonDidTap))
        startWithKakaoView.addGestureRecognizer(tap)
    }
    
    @objc private func loginButtonDidTap() {
    @objc private func presentCharacterChooseViewController() {
    }
    
    private func loginWithKakao() {
        if UserApi.isKakaoTalkLoginAvailable() {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                } else {
                    if let accessToken = oauthToken?.accessToken {
                        print("앱 로그인 성공" + accessToken)
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
