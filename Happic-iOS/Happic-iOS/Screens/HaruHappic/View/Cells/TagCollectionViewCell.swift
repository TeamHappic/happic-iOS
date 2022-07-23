//
//  TagCollectionViewCell.swift
//  Happic-iOS
//
//  Created by devxsby on 2022/07/12.
//

import UIKit

final class TagCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI
    private lazy var dailyLabel = UILabel().then {
        $0.text = "20 수"
        $0.textColor = .hpWhite
        $0.font = UIFont.font(.pretendardBold, ofSize: 16)
    }
    
    private lazy var whenLabel = UILabel().then {
        $0.text = "오후2시"
    }
    
    private lazy var whereLabel = UILabel().then {
        $0.text = "집구석구석"
    }
    
    private lazy var whoLabel = UILabel().then {
        $0.text = "햄식달식이"
    }
    
    private lazy var whatLabel = UILabel().then {
        $0.text = "짱짱귀여워"
    }
    
    private lazy var whenView = UIView().then {
        $0.addSubview(whenLabel)
        whenLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    private lazy var whereView = UIView().then {
        $0.addSubview(whereLabel)
        whereLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    private lazy var whoView = UIView().then {
        $0.addSubview(whoLabel)
        whoLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    private lazy var whatView = UIView().then {
        $0.addSubview(whatLabel)
        whatLabel.snp.makeConstraints { make in
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
        
        addSubview(dailyLabel)
        dailyLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
        }
        
        [whenLabel, whereLabel, whoLabel, whatLabel].forEach {
            $0.textColor = .hpWhite
            $0.font = UIFont.font(.pretendardBold, ofSize: 13)
        }
        
        [whenView, whereView, whoView, whatView].forEach {
            $0.layer.cornerRadius = 10
            $0.backgroundColor = .hpGray9
        }
        
        let stack = UIStackView(arrangedSubviews: [whenView, whereView, whoView, whatView])
        
        stack.spacing = 12
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        addSubview(stack)
        stack.snp.makeConstraints { make in
            make.top.equalTo(dailyLabel.snp.bottom).offset(10)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func setData(model: HaruHappicModel) {
        dailyLabel.text = "\(model.day) " + model.dayOfWeek
        whenLabel.text = "\(model.when)".timeFormatted
        whereLabel.text = model.place
        whoLabel.text = model.who
        whatLabel.text = model.what
        
        let date = Date()
        let todayDay = Calendar.current.dateComponents([.day], from: date)
        
        if model.day == todayDay.day {
            dailyLabel.textColor = .hpOrange
        }
    }
}
