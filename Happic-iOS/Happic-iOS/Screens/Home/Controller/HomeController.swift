//
//  HomeController.swift
//  Happic-iOS
//
//  Created by sejin on 2022/07/08.
//

import UIKit

final class HomeController: UIViewController {
    
    // MARK: - UI
    private lazy var nameLabel = UILabel().then {
        $0.text = "Lv1. 응애입니다."
        $0.textColor = .hpWhite
        $0.font = UIFont.font(.gmarketSansBold, ofSize: 16)
    }
    
    private lazy var progressLabel = UILabel().then {
        $0.text = "1/6"
        $0.textColor = .hpWhite
        $0.font = UIFont.font(.pretendardBold, ofSize: 12)
    }
    
    private lazy var levelProgressView = UIProgressView(
        progressViewStyle: .default).then {
            $0.progressTintColor = .hpDarkBlue
            $0.trackTintColor = .hpGray5
            $0.progress = 0.5
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setPurpleBackgroundColor()
        configureUI()
    }

    // MARK: - Functions
    private func configureUI() {
        view.addSubviews(nameLabel, progressLabel, levelProgressView)
        
        nameLabel.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(48)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(28)
        }
        
        progressLabel.snp.makeConstraints { make in
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(40)
            make.centerY.equalTo(nameLabel)
        }
        
        levelProgressView.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(48)
        }
    }
}
