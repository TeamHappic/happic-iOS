//
//  UIView+.swift
//  Happic-iOS
//
//  Created by sejin on 2022/07/09.
//

import UIKit

extension UIView {
    /// UIView 여러 개를 인자로 받아서 한 번에 addSubView
    func addSubviews(_ subviews: UIView...) {
      subviews.forEach(addSubview)
    }
    
    func addSubviewsList(_ views: [UIView]) {
      views.forEach { addSubview($0) }
    }
    
    /// UIView 의 모서리가 둥근 정도를 방향과 함께 설정하는 메서드
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    /// 그라데이션을 추가하는 메소드
    @discardableResult
    func setGradient(type: CAGradientLayerType,
                     colors: [CGColor],
                     locations: [NSNumber] = [0.0, 1.0],
                     startPoint: CGPoint = CGPoint(x: 0.0, y: 0.0),
                     endPoint: CGPoint = CGPoint(x: 1.0, y: 0.0)) -> Self {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.type = type
        gradient.colors = colors
        gradient.locations = locations
        gradient.startPoint = startPoint
        gradient.endPoint = endPoint
        gradient.frame = self.bounds
        layer.insertSublayer(gradient, at: 0)
        // layer.addSublayer(gradient)
        return self
    }
    
    @discardableResult
    func makeShadow(color: UIColor,
                    opacity: Float,
                    offset: CGSize,
                    radius: CGFloat) -> Self {
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        return self
    }
    
    func showNoneKeywordView() {
        let containerView = UIView().then {
            $0.backgroundColor = .hpGray9
            $0.tag = 1
        }
        
        let contentLabel = UILabel().then {
            $0.text = "수집된 키워드가 부족해요"
            $0.textColor = .hpGray2
            $0.font = UIFont.font(.gmarketSansBold, ofSize: 16)
        }
        
        addSubview(containerView)
        
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        containerView.addSubview(contentLabel)
        contentLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    func hideNoneKeywordView() {
        for view in subviews {
            if view.tag == 1 {
                view.removeFromSuperview()
            }
        }
    }
    
    func setDarkBlue() {
        setGradient(type: .axial, colors: [UIColor.hpDarkBlue.cgColor, UIColor.hpBgBlack0.cgColor], startPoint: CGPoint(x: 1.4, y: 1.4), endPoint: CGPoint(x: 0.7, y: 0.7))
    }
    
    func setDarkPurple() {
        setGradient(type: .axial, colors: [UIColor.hpDarkPurple.cgColor, UIColor.hpBgBlack0.cgColor], startPoint: CGPoint(x: 1.4, y: 1.4), endPoint: CGPoint(x: 0.7, y: 0.7))
    }
}
