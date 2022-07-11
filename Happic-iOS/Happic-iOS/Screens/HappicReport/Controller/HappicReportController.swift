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
    private let bestHappicMoment = BestHappicMomentView()
    
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
        view.addSubviews(reportScrollView, contentView)
        reportScrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(reportScrollView.contentLayoutGuide)
            make.width.equalTo(reportScrollView.snp.width)
            make.height.greaterThanOrEqualTo(reportScrollView.snp.height).priority(500)
        }
    }
    
    private func setSubViewsLayout() {
        contentView.addSubviews(bestHappicMoment)
        bestHappicMoment.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(60)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(287.adjustedH)
        }
    }
}
