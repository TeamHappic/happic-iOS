//
//  MonthHappicRecordController.swift
//  Happic-iOS
//
//  Created by sejin on 2022/07/13.
//

import UIKit

final class MonthHappicRecordController: UIViewController {
    
    // MARK: - UI
    private let monthHappicRecordView = MonthHappicRecordView()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    // MARK: - Functions
    private func configureUI() {
        view.addSubviews(monthHappicRecordView)
        monthHappicRecordView.headerView.hideShowDetailRankViewButton()
        monthHappicRecordView.snp.makeConstraints { make in
            make.leading.top.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(295)
        }
    }
}
