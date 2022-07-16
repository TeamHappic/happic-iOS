//
//  CustomMonthPickerView.swift
//  Happic-iOS
//
//  Created by devxsby on 2022/07/13.
//

import UIKit

class CustomMonthPickerView: UIView {
    
    // MARK: - Properties
    
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
        $0.backgroundColor = .hpBgBlack2h // 알파값주기 0.95
        $0.layer.cornerRadius = 8
        
        $0.addSubviews(lastYearSelectorButton, yearIndicatorLabel, nextYearSelectorButton)
        
        lastYearSelectorButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(34)
            make.top.equalToSuperview().offset(10)
            make.width.height.equalTo(48)
        }
        
        yearIndicatorLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(lastYearSelectorButton)
        }
        
        nextYearSelectorButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(34)
            make.width.height.equalTo(48)
            make.centerY.equalTo(lastYearSelectorButton)
        }
    }
    
    // 버튼 addtarget 추가하기
    private lazy var janButton = UIButton(type: .system).then {
        $0.setTitle("1월", for: .normal)
        $0.tintColor = .hpGray2
    }
    
    private lazy var febButton = UIButton(type: .system).then {
        $0.setTitle("2월", for: .normal)
        $0.tintColor = .hpGray2
    }
    
    private lazy var marButton = UIButton(type: .system).then {
        $0.setTitle("3월", for: .normal)
        $0.tintColor = .hpGray2
    }
    
    private lazy var aprButton = UIButton(type: .system).then {
        $0.setTitle("4월", for: .normal)
        $0.tintColor = .hpGray2
    }
    
    private lazy var mayButton = UIButton(type: .system).then {
        $0.setTitle("5월", for: .normal)
        $0.tintColor = .hpGray2
    }
    
    private lazy var junButton = UIButton(type: .system).then {
        $0.setTitle("6월", for: .normal)
        $0.tintColor = .hpGray2
    }
    
    private lazy var julButton = UIButton(type: .system).then {
        $0.setTitle("7월", for: .normal)
        $0.tintColor = .hpGray2
    }
    
    private lazy var augButton = UIButton(type: .system).then {
        $0.setTitle("8월", for: .normal)
        $0.tintColor = .hpGray2
    }
    
    private lazy var sepButton = UIButton(type: .system).then {
        $0.setTitle("9월", for: .normal)
        $0.tintColor = .hpGray2
    }
    
    private lazy var octButton = UIButton(type: .system).then {
        $0.setTitle("10월", for: .normal)
        $0.tintColor = .hpGray2
    }
    
    private lazy var novButton = UIButton(type: .system).then {
        $0.setTitle("11월", for: .normal)
        $0.tintColor = .hpGray2
    }
    
    private lazy var decButton = UIButton(type: .system).then {
        $0.setTitle("12월", for: .normal)
        $0.tintColor = .hpGray2
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
            make.edges.equalToSuperview().inset(1)
        }
        
        setMonthButtonStack()
    }
    
    private func setMonthButtonStack() {
        let stack1 = UIStackView(arrangedSubviews: [janButton, febButton, marButton, aprButton])
        let stack2 = UIStackView(arrangedSubviews: [mayButton, junButton, julButton, augButton])
        let stack3 = UIStackView(arrangedSubviews: [sepButton, octButton, novButton, decButton])
        let stacks: [UIStackView] = [stack1, stack2, stack3]
        
        for stack in stacks {
            stack.spacing = 20
            stack.axis = .horizontal
            stack.distribution = .fillEqually
        }
        
        [janButton, febButton, marButton, aprButton,
         mayButton, junButton, julButton, augButton,
         sepButton, octButton, novButton, decButton].forEach {
            $0.addTarget(self, action: #selector(monthButtonDidTap(sender: )), for: .touchUpInside)
        }
        
        let containerStack = UIStackView(arrangedSubviews: [stack1, stack2, stack3])
        
        addSubview(containerStack)
        containerStack.axis = .vertical
        containerStack.spacing = 10
        containerStack.distribution = .fillEqually
        
        containerStack.snp.makeConstraints { make in
            make.top.equalTo(yearIndicatorLabel.snp.bottom).offset(10)
            make.leading.trailing.equalTo(containerView).inset(10)
            make.height.equalTo(160)
        }
    }
    
    @objc private func monthButtonDidTap(sender: UIButton) {
        print(sender.currentTitle)
    }
}
