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
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Functions
    private func configureUI() {
        setScrollViewLayout()
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
}
