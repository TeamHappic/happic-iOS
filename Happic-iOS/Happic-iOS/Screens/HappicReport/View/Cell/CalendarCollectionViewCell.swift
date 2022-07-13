//
//  CalendarCollectionViewCell.swift
//  Happic-iOS
//
//  Created by sejin on 2022/07/13.
//

import UIKit

class CalendarCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI
    let dayLabel = UILabel().then {
        $0.text = "1"
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.textColor = .white
    }
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        backgroundColor = .gray
        addSubview(dayLabel)
        dayLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
