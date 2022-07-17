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
    func setGradient(colors: [CGColor],
                     locations: [NSNumber] = [0.0, 1.0],
                     startPoint: CGPoint = CGPoint(x: 0.0, y: 0.0),
                     endPoint: CGPoint = CGPoint(x: 1.0, y: 0.0)) -> Self {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = colors
        gradient.locations = locations
        gradient.startPoint = startPoint
        gradient.endPoint = endPoint
        gradient.frame = self.bounds
        layer.addSublayer(gradient)
        return self
    }
}
