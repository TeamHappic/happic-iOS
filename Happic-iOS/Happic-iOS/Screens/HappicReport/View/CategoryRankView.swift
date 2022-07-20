//
//  CategoryRankView.swift
//  Happic-iOS
//
//  Created by sejin on 2022/07/12.
//

import UIKit

final class CategoryRankView: UIView {
    
    // MARK: - Properties
    private lazy var whenViewController = CategoryDetailController(type: .whenCategory)
    private lazy var whereViewController = CategoryDetailController(type: .whereCategory)
    private lazy var whoViewController = CategoryDetailController(type: .whoCategory)
    private lazy var whatViewController = CategoryDetailController(type: .whatCategory)
    
    // ViewPager에 들어갈 카테고리 별 ViewController 처리
    private lazy var viewControllers = [whenViewController, whereViewController, whoViewController, whatViewController]
    
    // MARK: - UI
    let headerView = HappicReportSectionHeader(type: .categoryRank)
       
    private let containerView = UIView().then {
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
    }
    
    private lazy var categoryViewPager = CustomViewPager(
        viewControllers: viewControllers,
        buttonTitles: ["#when", "#where", "#who", "#what"],
        buttonTintColor: .hpGray6,
        isScrollEnabled: false)

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
        backgroundColor = UIColor.clear
        
        addSubviews(headerView, containerView)
        headerView.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
        }
        
        containerView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        containerView.addSubview(categoryViewPager)
        
        categoryViewPager.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func collectionViewCanScroll(_ isScrollEnabled: Bool) {
        viewControllers.forEach {
            $0.collectionViewCanScroll(isScrollEnabled)
        }
    }
}
