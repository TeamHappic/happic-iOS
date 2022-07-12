//
//  CategoryRankView.swift
//  Happic-iOS
//
//  Created by sejin on 2022/07/12.
//

import UIKit

class CategoryRankView: UIView {
    // MARK: - UI
    private lazy var headerView = HappicReportSectionHeader(type: .categoryRank)
    // ViewPager에 들어갈 카테고리 별 ViewController 처리
    private lazy var hourViewController = CategoryDetailController()
    private lazy var whereViewController = CategoryDetailController()
    private lazy var whoViewController = CategoryDetailController()
    private lazy var whatViewController = CategoryDetailController()
    
    private lazy var categoryViewPager = CustomViewPager(
        viewControllers: [hourViewController, whereViewController, whoViewController, whatViewController],
        buttonTitles: ["#hour", "#where", "#who", "#what"], isScrollEnabled: false)

    // MARK: - View Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        backgroundColor = .lightGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    private func configureUI() {
        addSubviews(headerView, categoryViewPager)
        headerView.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
        }
        
        categoryViewPager.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(32)
        }
    }
}
