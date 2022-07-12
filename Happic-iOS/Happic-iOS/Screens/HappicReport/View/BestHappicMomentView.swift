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
        let attributedString = NSMutableAttributedString(string: "이번 달 베스트 ", attributes: [.font: UIFont.systemFont(ofSize: 16, weight: .bold)])
        attributedString.append(NSAttributedString(string: "해픽 ",
                                                   attributes: [.font: UIFont.systemFont(ofSize: 16, weight: .bold),
                                                    .foregroundColor: UIColor.hp_orange]))
        attributedString.append(NSAttributedString(string: "모먼트는 이거야",
                                                   attributes: [.font: UIFont.systemFont(ofSize: 16, weight: .bold)]))
        $0.attributedText = attributedString
    }
    
    private lazy var bestHourLabel = UILabel().then {
        $0.text = "19:00"
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    }
    
    private lazy var bestWhereLabel = UILabel().then {
        $0.text = "내 방 구석"
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    }
    
    private lazy var bestWhoLabel = UILabel().then {
        $0.text = "햄식이"
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    }
    
    private lazy var bestWhatLabel = UILabel().then {
        $0.text = "귀여워"
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    }
    
    private lazy var hourLabel = UILabel().then {
        $0.text = "시에"
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 14, weight: .medium)
    }
    
    private lazy var whereLabel = UILabel().then {
        $0.text = "에서"
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 14, weight: .medium)
    }
    
    private lazy var whoLabel = UILabel().then {
        $0.text = "와 함께"
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 14, weight: .medium)
    }
    
    private lazy var whatLabel = UILabel().then {
        let attributedString = NSMutableAttributedString(string: "하는 순간이 가장 ", attributes: [.font: UIFont.systemFont(ofSize: 14, weight: .bold)])
        attributedString.append(NSAttributedString(string: "행복 ",
                                                   attributes: [.font: UIFont.systemFont(ofSize: 14, weight: .medium),
                                                    .foregroundColor: UIColor.hp_orange]))
        attributedString.append(NSAttributedString(string: "했어요",
                                                   attributes: [.font: UIFont.systemFont(ofSize: 14, weight: .bold)]))
        $0.attributedText = attributedString
    }
    
    private lazy var containerView = UIView().then {
        $0.backgroundColor = .gray
        $0.layer.cornerRadius = 10
        
        let bestKeywordStackView = UIStackView(arrangedSubviews: [bestHourLabel, bestWhereLabel, bestWhoLabel, bestWhatLabel])
        bestKeywordStackView.axis = .vertical
        bestKeywordStackView.alignment = .fill
        bestKeywordStackView.distribution = .equalSpacing
        $0.addSubview(bestKeywordStackView)
        bestKeywordStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(44)
            make.top.equalToSuperview().offset(28)
            make.bottom.equalToSuperview().inset(28)
        }
        
        let keywordStackView = UIStackView(arrangedSubviews: [hourLabel, whereLabel, whoLabel, whatLabel])
        keywordStackView.axis = .vertical
        keywordStackView.alignment = .fill
        keywordStackView.distribution = .equalSpacing
        $0.addSubview(keywordStackView)
        keywordStackView.snp.makeConstraints { make in
            make.leading.equalTo(bestKeywordStackView.snp.trailing).offset(19)
            make.top.equalToSuperview().offset(28)
            make.trailing.equalToSuperview().inset(27)
            make.bottom.equalToSuperview().inset(28)
        }
        
    }
    
    // MARK: - View Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    private func configureUI() {
        addSubviews(titleLabel, containerView)
        titleLabel.snp.makeConstraints { make in
            make.leading.top.equalToSuperview()
        }
        containerView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(11)
            make.leading.bottom.trailing.equalToSuperview()
        }
    }
}
