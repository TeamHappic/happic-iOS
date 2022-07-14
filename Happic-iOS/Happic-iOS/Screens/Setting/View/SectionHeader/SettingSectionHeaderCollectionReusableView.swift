//
//  SettingSectionHeaderCollectionReusableView.swift
//  Happic-iOS
//
//  Created by sejin on 2022/07/15.
//

import UIKit

class SettingSectionHeaderCollectionReusableView: UICollectionReusableView {
    
    // MARK: - UI
    lazy var sectionTitleLabel = UILabel().then {
        $0.text = "캐릭터"
        $0.textColor = .hpGray4
        $0.font = UIFont.font(.pretendardMedium, ofSize: 12)
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
        addSubview(sectionTitleLabel)
        sectionTitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(8)
        }
    }

}
