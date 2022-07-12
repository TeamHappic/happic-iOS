//
//  CategoryDetailCollectionViewCell.swift
//  Happic-iOS
//
//  Created by sejin on 2022/07/12.
//

import UIKit

final class CategoryDetailCollectionViewCell: UICollectionViewCell {
    // MARK: - UI
    private lazy var categoryNameLabel = UILabel().then {
        $0.text = "#who 1"
        $0.textColor = .gray
        $0.font = UIFont.font(.pretendardRegular, ofSize: 14)
    }
    
    private lazy var userKeywordLabel = UILabel().then {
        $0.text = "수빈"
        $0.textColor = .white
        $0.font = UIFont.font(.pretendardBold, ofSize: 16)
    }
    
    private lazy var countLabel = UILabel().then {
        $0.text = "xx회"
        $0.textColor = .white
        $0.font = UIFont.font(.pretendardMedium, ofSize: 14)
    }
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    private func configureUI() {
        backgroundColor = .hp_gray8

        addSubviews(categoryNameLabel, userKeywordLabel, countLabel)
        categoryNameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(24)
            make.centerY.equalToSuperview()
        }
        
        userKeywordLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(94)
            make.centerY.equalToSuperview()
        }
        
        countLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(42)
            make.centerY.equalToSuperview()
        }
    }
}
