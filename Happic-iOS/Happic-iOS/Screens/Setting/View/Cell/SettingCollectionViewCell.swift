//
//  SettingCollectionViewCell.swift
//  Happic-iOS
//
//  Created by sejin on 2022/07/15.
//

import UIKit

class SettingCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI
    private let alarmImageView = UIImageView().then {
        $0.image = ImageLiterals.icnInfo
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    
    lazy var settingNameLabel = UILabel().then {
        $0.text = "캐릭터 변경"
        $0.textColor = .hpGray3
        $0.font = UIFont.font(.pretendardMedium, ofSize: 14)
    }
    
    private let nextArrowImageView = UIImageView().then {
        $0.image = ImageLiterals.icnRight
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
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
        backgroundColor = .hpBgBlack0
        
        addSubviews(alarmImageView, settingNameLabel, nextArrowImageView)
        alarmImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.centerY.equalToSuperview()
        }
        
        settingNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(alarmImageView.snp.trailing).offset(26)
            make.centerY.equalToSuperview()
        }
        
        nextArrowImageView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(15)
            make.centerY.equalToSuperview()
        }
    }
}
