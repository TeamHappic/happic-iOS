//
//  MonthHappicRecordView.swift
//  Happic-iOS
//
//  Created by sejin on 2022/07/13.
//

import UIKit

final class MonthHappicRecordView: UIView {
    
    // MARK: - Properties
    var count: Int = 0 {
        didSet {
            if count < 2 {
                countImageView.image = ImageLiterals.imageMonthlyZero
            }
            
            countImageView.snp.updateConstraints { make in
                make.width.height.equalTo(100+3*count)
            }
        }
    }
    
    // MARK: - UI
    let headerView = HappicReportSectionHeader(type: .monthCount)
    private lazy var countImageView = UIImageView().then {
        $0.image = ImageLiterals.imageMonthlyCount
        $0.backgroundColor = .clear
    }
    
    private lazy var monthLabel = UILabel().then {
        $0.text = "6월"
        $0.font = UIFont.font(.pretendardMedium, ofSize: 14)
        $0.textColor = .hpGray2
        $0.textAlignment = .center
    }
    
    private lazy var countLabel = UILabel().then {
        $0.text = "\(count)회"
        $0.font = UIFont.font(.gmarketSansBold, ofSize: 20)
        $0.textColor = .hpGray2
        $0.textAlignment = .center
    }
    
    private lazy var monthCountStackView = UIStackView(arrangedSubviews: [monthLabel, countLabel]).then {
        $0.axis = .vertical
        $0.spacing = 4
    }
    
    private lazy var containerView = UIView().then {
        $0.addSubviews(countImageView, monthCountStackView)
        countImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.width.equalTo(100)
        }
        monthCountStackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
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
            make.top.equalTo(headerView.snp.bottom).offset(26)
            make.leading.bottom.trailing.equalToSuperview()
        }
    }
    
    func setData(model: Rank4S) {
        self.count = model.count
        monthLabel.text = "\(model.month)월"
        countLabel.text = "\(count)회"
    }
}
