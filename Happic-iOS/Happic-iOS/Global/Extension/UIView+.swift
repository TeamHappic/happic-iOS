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
}