//
//  KeywordRankController.swift
//  Happic-iOS
//
//  Created by sejin on 2022/07/13.
//

import UIKit

final class KeywordRankController: UIViewController {
    
    // MARK: - UI
    private lazy var keywordRankView = KeywordRankView()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    // MARK: - Functions
    private func configureUI() {
        view.addSubviews(keywordRankView)
        keywordRankView.headerView.hideShowDetailRankViewButton()
        keywordRankView.collectionViewCanScroll(true)
        keywordRankView.snp.makeConstraints { make in
            make.top.bottom.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
    }
}
