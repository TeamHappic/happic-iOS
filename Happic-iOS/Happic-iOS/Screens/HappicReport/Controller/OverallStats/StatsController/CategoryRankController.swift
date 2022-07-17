//
//  CategoryRankController.swift
//  Happic-iOS
//
//  Created by sejin on 2022/07/13.
//

import UIKit

final class CategoryRankController: UIViewController {
    
    // MARK: - UI
    private lazy var categoryRankView = CategoryRankView()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setBlueBackGroundColor()
        configureUI()
    }
    
    // MARK: - Functions
    private func configureUI() {
        view.addSubviews(categoryRankView)
        categoryRankView.headerView.hideShowDetailRankViewButton()
        categoryRankView.collectionViewCanScroll(true)
        categoryRankView.snp.makeConstraints { make in
            make.top.bottom.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
    }
}
