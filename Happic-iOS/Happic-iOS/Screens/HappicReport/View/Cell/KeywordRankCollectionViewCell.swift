//
//  KeywordRankCollectionViewCell.swift
//  Happic-iOS
//
//  Created by sejin on 2022/07/12.
//

import UIKit

final class KeywordRankCollectionViewCell: UICollectionViewCell {
    // MARK: - UI
    private lazy var rankLabel = UILabel().then {
        $0.text = "1"
        $0.textColor = .hpOrange
        $0.font = UIFont.font(.pretendardRegular, ofSize: 16)
    }
    
    private lazy var userKeywordLabel = UILabel().then {
        $0.text = "햄식이"
        $0.textColor = .white
        $0.font = UIFont.font(.gmarketSansBold, ofSize: 16)
    }
    
    private lazy var keywordNameLabel = UILabel().then {
        $0.text = "#who"
        $0.textColor = .gray
        $0.font = UIFont.font(.pretendardRegular, ofSize: 12)
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
        backgroundColor = .hpGray9
        layer.cornerRadius = 10
        
        addSubviews(rankLabel, userKeywordLabel, keywordNameLabel, countLabel)
        rankLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(24)
            make.centerY.equalToSuperview()
        }
        
        userKeywordLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(60)
            make.centerY.equalToSuperview()
        }
        
        keywordNameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(141)
            make.centerY.equalToSuperview()
        }
        
        countLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(42)
            make.centerY.equalToSuperview()
        }
    }
}
