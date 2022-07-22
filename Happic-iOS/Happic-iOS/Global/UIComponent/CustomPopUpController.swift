//
//  CustomPopUpController.swift
//  Happic-iOS
//
//  Created by sejin on 2022/07/15.
//

import UIKit

class CustomPopUpController: UIViewController {

    // MARK: - UI
    private lazy var containerView = UIView().then {
        $0.backgroundColor = .hpGray9
        $0.layer.cornerRadius = 12
    }
    
    private lazy var notificationImageView = UIImageView().then {
        $0.image = ImageLiterals.icnAlert
        $0.tintColor = .hpGray3
    }
    
    lazy var popUpTitleLabel = UILabel().then {
        $0.text = "캐릭터 변경 주의사항"
        $0.textColor = .hpWhite
        $0.font = UIFont.font(.gmarketSansBold, ofSize: 16)
    }
    
    private lazy var popUpContentsLabel = UILabel().then {
        $0.text = "변경 시 현재 캐릭터 성장이 \n초기화됩니다. \n정말 변경하시겠습니까?"
        $0.textColor = .hpWhite
        $0.addLabelSpacing(kernValue: 0, lineSpacing: 6)
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.font = UIFont.font(.pretendardMedium, ofSize: 14)
    }
    
    private lazy var cancelButton = UIButton(type: .system).then {
        $0.setTitle("취소", for: .normal)
        $0.setTitleColor(.hpGray4, for: .normal)
        $0.titleLabel?.font = UIFont.font(.pretendardMedium, ofSize: 16)
        $0.backgroundColor = .hpBgBlack2
        $0.layer.cornerRadius = 12
        $0.addTarget(self, action: #selector(handleCancelButtonDidTap), for: .touchUpInside)
    }
    
    private lazy var confirmButton = UIButton(type: .system).then {
        $0.setTitle("캐릭터 변경", for: .normal)
        $0.setTitleColor(.hpOrange, for: .normal)
        $0.titleLabel?.font = UIFont.font(.pretendardBold, ofSize: 16)
        $0.backgroundColor = .hpBgBlack2
        $0.layer.cornerRadius = 12
        $0.addTarget(self, action: #selector(confirmButtonDidTap), for: .touchUpInside)
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }

    // MARK: - Functions
    private func configureUI() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        containerView.addSubviews(notificationImageView, popUpTitleLabel,
                                  popUpContentsLabel, cancelButton, confirmButton)
        
        notificationImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.height.equalTo(24)
            make.top.equalToSuperview().inset(40)
        }
        
        popUpTitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(notificationImageView.snp.bottom).offset(15)
        }
        
        popUpContentsLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(popUpTitleLabel.snp.bottom).offset(16)
        }
        
        cancelButton.snp.makeConstraints { make in
            make.top.greaterThanOrEqualTo(popUpContentsLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().inset(28)
            make.bottom.equalToSuperview().inset(20)
            make.width.equalTo(106)
            make.height.equalTo(48)
        }
        
        confirmButton.snp.makeConstraints { make in
            make.leading.equalTo(cancelButton.snp.trailing).offset(12)
            make.trailing.equalToSuperview().inset(28)
            make.centerY.equalTo(cancelButton)
            make.height.equalTo(48)
        }
        
        view.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(300)
        }
    }
    
    func setPopUpText(title: String, contents: String, firstButtonTitle: String, secondButtonTitle: String) {
        popUpTitleLabel.text = title
        popUpContentsLabel.text = contents
        cancelButton.setTitle(firstButtonTitle, for: .normal)
        confirmButton.setTitle(secondButtonTitle, for: .normal)
    }
    
    @objc private func handleCancelButtonDidTap() {
        dismiss(animated: true)
    }
    
    @objc private func confirmButtonDidTap() {
        setConfirmButtonAction()
    }
    
    func setConfirmButtonAction() {
        if popUpTitleLabel.text == "캐릭터 변경 주의사항" {
            print("캐릭터 변경")
        } else {
            print("삭제하기")
            deleteContents()
        }
    }
}
}
