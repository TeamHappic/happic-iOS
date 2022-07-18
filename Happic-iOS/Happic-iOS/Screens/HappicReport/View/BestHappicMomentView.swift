//
//  BestHappicMomentView.swift
//  Happic-iOS
//
//  Created by sejin on 2022/07/08.
//

import UIKit

final class BestHappicMomentView: UIView {
    // MARK: - UI
    private let titleLabel = UILabel().then {
        let attributedString = NSMutableAttributedString(string: "이번 달 베스트 ", attributes: [.font: UIFont.font(.pretendardBold, ofSize: 16)])
        attributedString.append(NSAttributedString(string: "해픽 ",
                                                   attributes: [.font: UIFont.font(.pretendardBold, ofSize: 16),
                                                                .foregroundColor: UIColor.hpOrange]))
        attributedString.append(NSAttributedString(string: "모먼트는 이거야",
                                                   attributes: [.font: UIFont.font(.pretendardBold, ofSize: 16)]))
        $0.attributedText = attributedString
    }
    
    private lazy var characterImageView = UIImageView().then {
        $0.image = ImageLiterals.imageCloudLv4
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    
    private lazy var bestWhenLabel = UILabel().then {
        $0.text = "오후2시"
        $0.textColor = .white
        $0.font = UIFont.font(.gmarketSansBold, ofSize: 20)
    }
    
    private lazy var bestWhereLabel = UILabel().then {
        $0.text = "집구석구석"
        $0.textColor = .white
        $0.font = UIFont.font(.gmarketSansBold, ofSize: 20)
    }
    
    private lazy var bestWhoLabel = UILabel().then {
        $0.text = "햄식달식이"
        $0.textColor = .white
        $0.font = UIFont.font(.gmarketSansBold, ofSize: 20)
    }
    
    private lazy var bestWhatLabel = UILabel().then {
        $0.text = "짱짱귀여워"
        $0.textColor = .white
        $0.font = UIFont.font(.gmarketSansBold, ofSize: 20)
    }
    
    private lazy var whenLabel = UILabel().then {
        $0.text = "시에"
        $0.textColor = .white
        $0.font = UIFont.font(.pretendardMedium, ofSize: 14)
    }
    
    private lazy var whereLabel = UILabel().then {
        $0.text = "에서"
        $0.textColor = .white
        $0.font = UIFont.font(.pretendardMedium, ofSize: 14)
    }
    
    private lazy var whoLabel = UILabel().then {
        $0.text = "와 함께"
        $0.textColor = .white
        $0.font = UIFont.font(.pretendardMedium, ofSize: 14)
    }
    
    private lazy var whatLabel = UILabel().then {
        let attributedString = NSMutableAttributedString(string: "하는 순간이 가장 ", attributes: [.font: UIFont.systemFont(ofSize: 14, weight: .bold)])
        attributedString.append(NSAttributedString(string: "행복",
                                                   attributes: [.font: UIFont.font(.pretendardMedium, ofSize: 14),
                                                                .foregroundColor: UIColor.hpOrange]))
        attributedString.append(NSAttributedString(string: "했어요",
                                                   attributes: [.font: UIFont.font(.pretendardMedium, ofSize: 14)]))
        $0.attributedText = attributedString
    }
    
    lazy var backgroundView = UIView().then {
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
    }
    
    lazy var containerView = UIView().then {
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        
        let bestKeywordStackView = UIStackView(arrangedSubviews: [bestWhenLabel, bestWhereLabel, bestWhoLabel, bestWhatLabel])
        bestKeywordStackView.axis = .vertical
        bestKeywordStackView.distribution = .fillEqually
        bestKeywordStackView.spacing = 24
        $0.addSubview(bestKeywordStackView)
        bestKeywordStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(44)
            make.top.equalToSuperview().offset(28)
            make.bottom.equalToSuperview().inset(28)
        }
        
        let keywordStackView = UIStackView(arrangedSubviews: [whenLabel, whereLabel, whoLabel, whatLabel])
        keywordStackView.axis = .vertical
        keywordStackView.spacing = 24
        keywordStackView.distribution = .fillEqually
        $0.addSubview(keywordStackView)
        keywordStackView.snp.makeConstraints { make in
            make.leading.equalTo(bestKeywordStackView.snp.trailing).offset(19)
            make.top.equalTo(bestKeywordStackView)
            make.trailing.equalToSuperview().inset(27)
            make.bottom.equalTo(bestKeywordStackView)
        }
        
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
        addSubviews(titleLabel, characterImageView, backgroundView)
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview().inset(19)
            make.height.equalTo(24)
        }
        backgroundView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(11)
            make.leading.bottom.trailing.equalToSuperview()
        }
        characterImageView.snp.makeConstraints { make in
            make.leading.greaterThanOrEqualTo(titleLabel.snp.trailing).offset(10)
            make.trailing.equalTo(backgroundView.snp.trailing).inset(21)
            make.bottom.equalTo(backgroundView.snp.top).inset(24)
            make.width.height.equalTo(67)
        }
    }
    
    func setBackgroundColor() {
        backgroundView.setGradient(type: .radial,
                                   colors: [UIColor.hpDarkBlue.cgColor, UIColor.hpGray9.cgColor],
                                   startPoint: CGPoint(x: 1.4, y: -0.5),
                                   endPoint: CGPoint(x: 2.4, y: 0.8))
        
        backgroundView.addSubviews(containerView)
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
                
        backgroundView.layer.applyShadow(color: .black, alpha: 0.25, x: 8, y: 8, blur: 16, spread: 0)
        backgroundView.clipsToBounds = true
    }
}
