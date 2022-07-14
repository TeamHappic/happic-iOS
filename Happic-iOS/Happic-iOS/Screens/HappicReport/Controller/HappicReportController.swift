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
    private let categoryRankView = CategoryRankView()
    private let monthHappicRecordView = MonthHappicRecordView()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setDelegate()
    }
    
    // MARK: - Functions
    private func configureUI() {
        setScrollViewLayout()
        setSubViewsLayout()
    }
    
    private func setDelegate() {
        keywordRankView.headerView.delegate = self
        categoryRankView.headerView.delegate = self
        monthHappicRecordView.headerView.delegate = self
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
        contentView.addSubviews(bestHappicMomentView, keywordRankView, categoryRankView, monthHappicRecordView)
        bestHappicMomentView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(60)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(292)
        }
        
        keywordRankView.snp.makeConstraints { make in
            make.top.equalTo(bestHappicMomentView.snp.bottom).offset(32)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(374)
        }
        
        categoryRankView.snp.makeConstraints { make in
            make.top.equalTo(keywordRankView.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(525)
        }
        
        monthHappicRecordView.snp.makeConstraints { make in
            make.top.equalTo(categoryRankView.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(313)
            make.bottom.equalToSuperview().inset(50)
        }
    }
}

// MARK: - Extensions

extension HappicReportController: HappicReportSectionHeaderDelegate {
    func showOverallStatsController(type: HappicReportSectionType) {
        let overallStatsController = OverallStatsController()
        overallStatsController.selectedIndex = type.rawValue
        self.navigationController?.pushViewController(overallStatsController, animated: true)
    }
}
