//
//  HappicCapsuleController.swift
//  Happic-iOS
//
//  Created by sejin on 2022/07/08.
//

import UIKit

class HappicCapsuleController: UIViewController {
    
    // MARK: - UI
    private lazy var cancelButton = UIButton(type: .system).then {
        $0.setImage(ImageLiteral.icnCancel, for: .normal)
        $0.tintColor = .hpGray6
    }
    
    private lazy var titleLabel = UILabel().then {
        $0.text = "해픽 캡슐"
        $0.textColor = .hpGray3
        $0.font = UIFont.font(.gmarketSansBold, ofSize: 20)
    }
    
    private lazy var descriptionLabel = UILabel().then {
        $0.text = "너가 기록한 행복의 순간 중 하나를 보여줄게!"
        $0.textColor = .hpGray3
        $0.font = UIFont.font(.pretendardMedium, ofSize: 12)
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: - Functions
    private func configureUI() {
        view.backgroundColor = .hpBgBlack2h
        view.addSubviews(cancelButton, titleLabel, descriptionLabel)
        
        cancelButton.snp.makeConstraints { make in
            make.top.trailing.equalTo(view.safeAreaLayoutGuide).inset(5)
            make.width.height.equalTo(48)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(cancelButton.snp.bottom).offset(3)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(titleLabel.snp.bottom).offset(12)
        }
    }
}
