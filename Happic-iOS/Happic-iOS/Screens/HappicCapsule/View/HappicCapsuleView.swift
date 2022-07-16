//
//  HappicCapsuleView.swift
//  Happic-iOS
//
//  Created by sejin on 2022/07/08.
//

import UIKit

final class HappicCapsuleView: UIView {
    
    // MARK: - UI
    private lazy var happicImageView = UIImageView().then {
        $0.image = UIImage(named: "AppIcon")
        $0.layer.cornerRadius = 10
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    
    private lazy var dateLabel = UILabel().then {
        $0.text = "2022.06.26"
        $0.textColor = .hpGray3
        $0.font = UIFont.font(.pretendardBold, ofSize: 16)
    }
    
    private lazy var whenLabel = UILabel().then {
        $0.text = "#오후8시"
        $0.textColor = .hpGray3
        $0.font = UIFont.font(.pretendardMedium, ofSize: 12)
        $0.textAlignment = .center
    }
    
    private lazy var whereLabel = UILabel().then {
        $0.text = "#집구석"
        $0.textColor = .hpGray3
        $0.font = UIFont.font(.pretendardMedium, ofSize: 12)
        $0.textAlignment = .center
    }
    
    private lazy var whoLabel = UILabel().then {
        $0.text = "#햄식이"
        $0.textColor = .hpGray3
        $0.font = UIFont.font(.pretendardMedium, ofSize: 12)
        $0.textAlignment = .center
    }
    
    private lazy var whatLabel = UILabel().then {
        $0.text = "#귀여워요오"
        $0.textColor = .hpGray3
        $0.font = UIFont.font(.pretendardMedium, ofSize: 12)
        $0.textAlignment = .center
    }
    
    private lazy var tagContainerStackView = UIStackView(
        arrangedSubviews: [whenLabel, whereLabel, whoLabel, whatLabel]).then {
            $0.axis = .horizontal
            $0.distribution = .fillEqually
            $0.spacing = 4
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
        self.layer.cornerRadius = 10
        self.backgroundColor = .hpBgBlack1
        
        addSubviews(happicImageView, dateLabel, tagContainerStackView)
        
        happicImageView.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview().inset(10)
            make.height.equalTo(happicImageView.snp.width)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(happicImageView.snp.bottom).offset(26)
            make.centerX.equalToSuperview()
        }
        
        tagContainerStackView.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(12)
            make.leading.trailing.equalToSuperview().inset(12)
            make.bottom.equalToSuperview().inset(24)
        }
    }
}
