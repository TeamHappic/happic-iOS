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
        addSubviews(headerView)
        headerView.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
        }
    }
}
