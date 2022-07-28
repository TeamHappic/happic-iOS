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
    
    func makeAlert(title: String, message: String? = nil,
                   okTitle: String = "확인", okAction: ((UIAlertAction) -> Void)? = nil,
                   completion : (() -> Void)? = nil) {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
        let alertVC = UIAlertController(title: title, message: message,
                                                    preferredStyle: .alert)
        let okAction = UIAlertAction(title: okTitle, style: .default, handler: okAction)
        alertVC.addAction(okAction)
        self.present(alertVC, animated: true, completion: completion)
    }
}
