//
//  HappicReportSectionHeader.swift
//  Happic-iOS
//
//  Created by sejin on 2022/07/12.
//

import UIKit

enum HappicReportSectionType: Int {
    case keywordRank
    case categoryRank
    case monthCount
    case monthCalendar
}

protocol HappicReportSectionHeaderDelegate: AnyObject {
    func showOverallStatsController(type: HappicReportSectionType)
}

final class HappicReportSectionHeader: UIView {
    // MARK: - Properties
    var type: HappicReportSectionType = .keywordRank
    weak var delegate: HappicReportSectionHeaderDelegate?

    // MARK: - UI
    private let sectionDividerImageView = UIImageView().then {
        $0.image = ImageLiterals.imageStar
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.backgroundColor = .black
        $0.tintColor = .white
    }
    
    private lazy var sectionTitleLabel = UILabel().then {
        $0.text = "당신의 행복 키워드 순위"
        $0.textColor = .white
        $0.font = UIFont.font(.pretendardBold, ofSize: 16)
    }
    
    private lazy var showDetailRankViewButton = UIButton(type: .system).then {
        $0.setImage(ImageLiterals.icnRight, for: .normal)
        $0.tintColor = .hpGray3
        $0.addTarget(self, action: #selector(showDetailRankViewButtonDidTap), for: .touchUpInside)
    }
    
    // MARK: - Initialization
    init(type: HappicReportSectionType) {
        self.type = type
        super.init(frame: .zero)
        configureUI(type: type)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    private func configureUI(type: HappicReportSectionType) {
        setSubViewLayout()
        switch type {
        case .keywordRank:
            sectionTitleLabel.text = "당신의 행복 키워드 순위"
        case .categoryRank:
            sectionTitleLabel.text = "카테고리 별 행복 키워드 순위"
        case .monthCount:
            sectionTitleLabel.text = "월 별 해픽 기록"
        case .monthCalendar:
            sectionTitleLabel.text = "이번달 모은 행복의 조각"
        }
    }
    
    private func setSubViewLayout() {
        addSubviews(sectionDividerImageView, sectionTitleLabel, showDetailRankViewButton)
        sectionDividerImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview().inset(32)
            make.width.height.equalTo(16)
        }
        
        sectionTitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalTo(sectionDividerImageView.snp.bottom).offset(11)
            make.bottom.equalToSuperview().inset(12)
        }
        
        showDetailRankViewButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.centerY.equalTo(sectionTitleLabel)
            make.width.height.equalTo(48)
        }
    }
    
    func hideShowDetailRankViewButton() {
        showDetailRankViewButton.isHidden = true
    }
    
    @objc func showDetailRankViewButtonDidTap() {
        delegate?.showOverallStatsController(type: type)
    }
}
