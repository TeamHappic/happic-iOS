//
//  CategoryDetailWithImageCollectionViewCell.swift
//  Happic-iOS
//
//  Created by sejin on 2022/07/12.
//

import UIKit

final class CategoryDetailWithImageCollectionViewCell: UICollectionViewCell {
 
    // MARK: - UI
    private lazy var categoryNameLabel = UILabel().then {
        $0.text = "#who 1"
        $0.textColor = .gray
        $0.font = UIFont.font(.pretendardRegular, ofSize: 14)
    }
    
    private lazy var userKeywordLabel = UILabel().then {
        $0.text = "햄식이"
        $0.textColor = .white
        $0.font = UIFont.font(.pretendardBold, ofSize: 16)
    }
    
    private lazy var countLabel = UILabel().then {
        $0.text = "xx회"
        $0.textColor = .white
        $0.font = UIFont.font(.pretendardMedium, ofSize: 14)
    }
    
    private lazy var firstImageView = UIImageView().then {
        $0.image = UIImage(named: "icn_splash")
        $0.contentMode = .scaleToFill
        $0.clipsToBounds = true
        $0.tintColor = .white
        $0.backgroundColor = .black
    }
    
    private lazy var secondImageView = UIImageView().then {
        $0.image = UIImage(named: "icn_splash")
        $0.contentMode = .scaleToFill
        $0.clipsToBounds = true
        $0.tintColor = .white
        $0.backgroundColor = .black
    }
    
    private lazy var thirdImageView = UIImageView().then {
        $0.image = UIImage(named: "icn_splash")
        $0.contentMode = .scaleToFill
        $0.clipsToBounds = true
        $0.tintColor = .white
        $0.backgroundColor = .black
    }
    
    private lazy var imageStackView = UIStackView(arrangedSubviews: [firstImageView, secondImageView, thirdImageView]).then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.spacing = 12
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
        backgroundColor = .hpGray8
        layer.cornerRadius = 10
        
        addSubviews(categoryNameLabel, userKeywordLabel, countLabel, imageStackView)
        
        categoryNameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(24)
            make.top.equalToSuperview().inset(18)
        }
        
        userKeywordLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(94)
            make.centerY.equalTo(categoryNameLabel)
        }
        
        countLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(42)
            make.centerY.equalTo(categoryNameLabel)
        }
        
        imageStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(categoryNameLabel.snp.bottom).offset(17)
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(88)
        }        
    }
    
    func setCategoryNameLabel(type: CategoryType, index: Int) {
        switch type {
        case .hourCategory:
            categoryNameLabel.attributedText = makeCategoryString(category: "#hour ", index: index)
        case .whereCategory:
            categoryNameLabel.attributedText = makeCategoryString(category: "#where ", index: index)
        case .whoCategory:
            categoryNameLabel.attributedText = makeCategoryString(category: "#who ", index: index)
        case .whatCategory:
            categoryNameLabel.attributedText = makeCategoryString(category: "#what ", index: index)
        }
    }
    
    func makeCategoryString(category: String, index: Int) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: category,
                                                         attributes:
                                                            [.font: UIFont.font(.pretendardRegular, ofSize: 14), .foregroundColor: UIColor.gray])
        attributedString.append(NSAttributedString(string: String(index),
                                                   attributes: [.font: UIFont.font(.pretendardBold, ofSize: 14),
                                                    .foregroundColor: UIColor.gray]))
        return attributedString
    }
}