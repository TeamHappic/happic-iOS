//
//  HappicReportController.swift
//  Happic-iOS
//
//  Created by sejin on 2022/07/08.
//

import UIKit
import SnapKit
import Then

final class HappicReportController: UIViewController {
    
    // MARK: - UI
    private let reportScrollView = UIScrollView()
    private let contentView = UIView()
    private let bestHappicMomentView = BestHappicMomentView()
    private let keywordRankView = KeywordRankView()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Functions
    private func configureUI() {
        setScrollViewLayout()
        setSubViewsLayout()
    }
    
    private func setScrollViewLayout() {
        view.addSubviews(reportScrollView)
        reportScrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        reportScrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(reportScrollView.contentLayoutGuide)
            make.width.equalTo(reportScrollView.snp.width)
            make.height.greaterThanOrEqualTo(reportScrollView.snp.height).priority(500)
        }
    }
    
    private func setSubViewsLayout() {
        contentView.addSubviews(bestHappicMomentView, keywordRankView)
        bestHappicMomentView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(60)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(287.adjustedH)
        }
        
        keywordRankView.snp.makeConstraints { make in
            make.top.equalTo(bestHappicMomentView.snp.bottom).offset(32)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(374.adjustedH)
            make.bottom.equalToSuperview().inset(50)
        }
        
    }
}
