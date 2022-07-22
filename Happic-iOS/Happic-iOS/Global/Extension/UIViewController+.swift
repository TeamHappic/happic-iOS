//
//  UIViewController+.swift
//  Happic-iOS
//
//  Created by sejin on 2022/07/09.
//

import UIKit

extension UIViewController {
    /**
     - Description: 화면 터치시 작성 종료
     */
    /// 화면 터치시 작성 종료하는 메서드
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    /**
     - Description: 화면 터치시 키보드 내리는 Extension
     */
    /// 화면 터치시 키보드 내리는 메서드
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func setPurpleBackgroundColor() {
        self.view.setGradient(type: .radial,
                              colors: [UIColor.hpDarkPurple.cgColor, UIColor.hpBgBlack1.cgColor],
                              startPoint: CGPoint(x: 0.5, y: -0.2),
                              endPoint: CGPoint(x: 1.4, y: 0.3))
    }
    
    func setBlueBackGroundColor() {
        self.view.setGradient(type: .radial,
                              colors: [UIColor.hpDarkBlue.cgColor, UIColor.hpBgBlack1.cgColor],
                              startPoint: CGPoint(x: 1.2, y: -0.6),
                              endPoint: CGPoint(x: 2.4, y: 0.4))
    }
    
    func showNoneKeywordViewAtViewController() {
        let backgroundView = UIView().then {
            $0.setDarkBlue()
        }
        
        let containerView = UIView().then {
            $0.backgroundColor = .clear
            $0.tag = 2
        }
        
        let logoImageView = UIImageView().then {
            $0.image = ImageLiterals.imageEmpty
            $0.contentMode = .scaleAspectFill
        }
        
        let contentLabel = UILabel().then {
            $0.text = "수집된 키워드가 부족해요"
            $0.textColor = .hpGray7
            $0.font = UIFont.font(.pretendardMedium, ofSize: 16)
        }
        
        containerView.addSubviews(logoImageView, contentLabel)
        
        logoImageView.snp.makeConstraints { make in
            make.width.height.equalTo(192)
            make.leading.top.trailing.equalToSuperview()
        }
        
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
        }
        
        backgroundView.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        view.addSubview(backgroundView)
        
        backgroundView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func hideNoneKeywordViewAtViewController() {
        for view in view.subviews {
            if view.tag == 2 {
                view.removeFromSuperview()
            }
        }
    }
}
