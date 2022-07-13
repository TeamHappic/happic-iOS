//
//  CustomMonthPickerView.swift
//  Happic-iOS
//
//  Created by devxsby on 2022/07/13.
//

import UIKit

//protocol SendMonthDataDelegate {
//    func monthData(_data: String)
//}

class CustomMonthPickerView: UIView {
    
    // MARK: - Properties
//    var delegate: SendMonthDataDelegate?
//    var month: String
    
    // MARK: - UI
    private lazy var lastYearSelectorButton = UIButton(type: .system).then {
        $0.setImage(ImageLiteral.icnArrowBack, for: .normal)
        $0.tintColor = .hpGray5
    }
    
    private lazy var nextYearSelectorButton = UIButton(type: .system).then {
        $0.setImage(ImageLiteral.icnArrowNext, for: .normal)
        $0.tintColor = .hpGray5
    }
    
    private lazy var yearIndicatorLabel = UILabel().then {
        $0.text = "2022"
        $0.textColor = .hpGray4
        $0.font = UIFont.font(.pretendardBold, ofSize: 16)
    }
    
    private lazy var containerView = UIView().then {
        $0.backgroundColor = .hpBgBlack2h //알파값주기 0.95
        $0.layer.cornerRadius = 8
        
        $0.addSubviews(yearIndicatorLabel, lastYearSelectorButton, nextYearSelectorButton)
        
        yearIndicatorLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
        }
        
        lastYearSelectorButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(34)
            make.top.equalToSuperview().offset(10)
            make.width.height.equalTo(48)
        }
        
        nextYearSelectorButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(34)
            make.top.equalToSuperview().offset(10)
            make.width.height.equalTo(48)
        }
    }
    
    // 버튼 addtarget 추가하기
    private lazy var janButton = UIButton(type: .system).then {
        $0.setTitle("1월", for: .normal)
        $0.tintColor = .hpGray2
        $0.backgroundColor = .green
    }
    
    private lazy var febButton = UIButton(type: .system).then {
        $0.setTitle("2월", for: .normal)
        $0.tintColor = .hpGray2
        $0.backgroundColor = .green
    }
    
    private lazy var marButton = UIButton(type: .system).then {
        $0.setTitle("3월", for: .normal)
        $0.tintColor = .hpGray2
        $0.backgroundColor = .green
    }
    
    private lazy var aprButton = UIButton(type: .system).then {
        $0.setTitle("4월", for: .normal)
        $0.tintColor = .hpGray2
        $0.backgroundColor = .green
    }
    
    private lazy var mayButton = UIButton(type: .system).then {
        $0.setTitle("5월", for: .normal)
        $0.tintColor = .hpGray2
        $0.backgroundColor = .green
    }
    
    private lazy var junButton = UIButton(type: .system).then {
        $0.setTitle("6월", for: .normal)
        $0.tintColor = .hpGray2
        $0.backgroundColor = .green
    }
    
    private lazy var julButton = UIButton(type: .system).then {
        $0.setTitle("7월", for: .normal)
        $0.tintColor = .hpGray2
        $0.backgroundColor = .green
    }
    
    private lazy var augButton = UIButton(type: .system).then {
        $0.setTitle("8월", for: .normal)
        $0.tintColor = .hpGray2
        $0.backgroundColor = .green
    }
    
    private lazy var sepButton = UIButton(type: .system).then {
        $0.setTitle("9월", for: .normal)
        $0.tintColor = .hpGray2
        $0.backgroundColor = .green
    }
    
    private lazy var octButton = UIButton(type: .system).then {
        $0.setTitle("10월", for: .normal)
        $0.tintColor = .hpGray2
        $0.backgroundColor = .green
    }
    
    private lazy var novButton = UIButton(type: .system).then {
        $0.setTitle("11월", for: .normal)
        $0.tintColor = .hpGray2
        $0.backgroundColor = .green
    }
    
    private lazy var decButton = UIButton(type: .system).then {
        $0.setTitle("12월", for: .normal)
        $0.tintColor = .hpGray2
        $0.backgroundColor = .green
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
        
        backgroundColor = .hpDarkPurple
        layer.cornerRadius = 8
        
        addSubview(containerView)
        
        containerView.snp.makeConstraints { make in
//            make.center.equalToSuperview()
            make.edges.equalToSuperview().inset(1)
        }
        
        let stack1 = UIStackView(arrangedSubviews: [janButton, febButton, marButton, aprButton])
        let stack2 = UIStackView(arrangedSubviews: [marButton, junButton, julButton, ])

    }

    private func sendData() {
        // 달 버튼에 대한 클릭 액션 받으면 딜리게이트로 값 상위 뷰에 넘기기
        
//        month = month.split(separator: "월")
//        delegate?.monthData(_data: month)
    }
}
