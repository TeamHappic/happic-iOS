//
//  TagCollectionViewCell.swift
//  Happic-iOS
//
//  Created by devxsby on 2022/07/12.
//

import UIKit

final class TagCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI
    private lazy var dailyLabel = UILabel().then {
        $0.text = "26 일"
        $0.textColor = .hpWhite
        $0.font = UIFont.font(.pretendardExtraBold, ofSize: 16)
    }
    
    private lazy var whenLabel = UILabel().then {
        $0.text = "오후2시"
        $0.textColor = .hpWhite
        $0.font = UIFont.font(.pretendardMedium, ofSize: 14)
    }
    
    private lazy var whenView = UIView().then {
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .hpGray9
        $0.addSubview(whenLabel)
        whenLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    private lazy var whereView = UIView().then {
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .hpGray9
        $0.addSubview(whereLabel)
        whereLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    private lazy var whereLabel = UILabel().then {
        $0.text = "집구석구석"
        $0.textColor = .hpWhite
        $0.font = UIFont.font(.pretendardMedium, ofSize: 14)
    }
    
    private lazy var whoView = UIView().then {
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .hpGray9
        $0.addSubview(whoLabel)
        whoLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    private lazy var whoLabel = UILabel().then {
        $0.text = "햄식달식이"
        $0.textColor = .hpWhite
        $0.font = UIFont.font(.pretendardMedium, ofSize: 14)
    }
    
    private lazy var whatView = UIView().then {
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .hpGray9
        $0.addSubview(whatLabel)
        whatLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    private lazy var whatLabel = UILabel().then {
        $0.text = "짱짱귀여워"
        $0.textColor = .hpWhite
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
        
        addSubview(dailyLabel)
        dailyLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
        }
        
        let stack = UIStackView(arrangedSubviews: [whenView, whereView, whoView, whatView])
        
        stack.spacing = 12
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        addSubview(stack)
        stack.snp.makeConstraints { make in
            make.top.equalTo(dailyLabel.snp.bottom).offset(10)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}
