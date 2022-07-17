//
//  CustomMonthPickerView.swift
//  Happic-iOS
//
//  Created by devxsby on 2022/07/13.
//

import UIKit

// MARK: - Protocols
protocol CustomMonthPickerViewDelegate: AnyObject {
    func changeMonthStatus(_ month: String)
}

final class CustomMonthPickerView: UIView {
    
    // MARK: - Properties
    weak var delegate: CustomMonthPickerViewDelegate?
    private var selectedButton: UIButton?
    
    // MARK: - UI
    private lazy var lastYearSelectorButton = UIButton(type: .system).then {
        $0.setImage(ImageLiterals.icnLeft, for: .normal)
        $0.tintColor = .hpGray5
    }
    
    private lazy var nextYearSelectorButton = UIButton(type: .system).then {
        $0.setImage(ImageLiterals.icnRight, for: .normal)
        $0.tintColor = .hpGray5
    }
    
    private lazy var yearIndicatorLabel = UILabel().then {
        $0.text = "2022"
        $0.textColor = .hpGray4
        $0.font = UIFont.font(.gmarketSansBold, ofSize: 16)
    }
    
    private lazy var containerView = UIView().then {
        
        $0.backgroundColor = .hpBgBlack2.withAlphaComponent(0.95)
        $0.layer.borderColor = UIColor.hpDarkPurple.cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 8
        
        $0.addSubviews(lastYearSelectorButton, yearIndicatorLabel, nextYearSelectorButton)
        
        lastYearSelectorButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(30)
            make.top.equalToSuperview().offset(24)
            make.width.height.equalTo(20)
        }
        
        yearIndicatorLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(lastYearSelectorButton)
        }
        
        nextYearSelectorButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(30)
            make.width.height.equalTo(20)
            make.centerY.equalTo(lastYearSelectorButton)
        }
    }
    
    private lazy var janButton = UIButton(type: .system).then {
        $0.setAttributedTitle(NSAttributedString(string: "1월", attributes: [.font: UIFont.font(.pretendardMedium, ofSize: 16), .foregroundColor: UIColor.hpGray2]), for: .normal)
    }
    
    private lazy var febButton = UIButton(type: .system).then {
        $0.setAttributedTitle(NSAttributedString(string: "2월", attributes: [.font: UIFont.font(.pretendardMedium, ofSize: 16), .foregroundColor: UIColor.hpGray2]), for: .normal)
    }
    
    private lazy var marButton = UIButton(type: .system).then {
        $0.setAttributedTitle(NSAttributedString(string: "3월", attributes: [.font: UIFont.font(.pretendardMedium, ofSize: 16), .foregroundColor: UIColor.hpGray2]), for: .normal)
    }
    
    private lazy var aprButton = UIButton(type: .system).then {
        $0.setAttributedTitle(NSAttributedString(string: "4월", attributes: [.font: UIFont.font(.pretendardMedium, ofSize: 16), .foregroundColor: UIColor.hpGray2]), for: .normal)
    }
    
    private lazy var mayButton = UIButton(type: .system).then {
        $0.setAttributedTitle(NSAttributedString(string: "5월", attributes: [.font: UIFont.font(.pretendardMedium, ofSize: 16), .foregroundColor: UIColor.hpGray2]), for: .normal)
    }
    
    private lazy var junButton = UIButton(type: .system).then {
        $0.setAttributedTitle(NSAttributedString(string: "6월", attributes: [.font: UIFont.font(.pretendardMedium, ofSize: 16), .foregroundColor: UIColor.hpGray2]), for: .normal)
    }
    
    private lazy var julButton = UIButton(type: .system).then {
        $0.setAttributedTitle(NSAttributedString(string: "7월", attributes: [.font: UIFont.font(.pretendardMedium, ofSize: 16), .foregroundColor: UIColor.hpGray2]), for: .normal)
    }
    
    private lazy var augButton = UIButton(type: .system).then {
        $0.setAttributedTitle(NSAttributedString(string: "8월", attributes: [.font: UIFont.font(.pretendardMedium, ofSize: 16), .foregroundColor: UIColor.hpGray2]), for: .normal)
    }
    
    private lazy var sepButton = UIButton(type: .system).then {
        $0.setAttributedTitle(NSAttributedString(string: "9월", attributes: [.font: UIFont.font(.pretendardMedium, ofSize: 16), .foregroundColor: UIColor.hpGray2]), for: .normal)
    }
    
    private lazy var octButton = UIButton(type: .system).then {
        $0.setAttributedTitle(NSAttributedString(string: "10월", attributes: [.font: UIFont.font(.pretendardMedium, ofSize: 16), .foregroundColor: UIColor.hpGray2]), for: .normal)
    }
    
    private lazy var novButton = UIButton(type: .system).then {
        $0.setAttributedTitle(NSAttributedString(string: "11월", attributes: [.font: UIFont.font(.pretendardMedium, ofSize: 16), .foregroundColor: UIColor.hpGray2]), for: .normal)
    }
    
    private lazy var decButton = UIButton(type: .system).then {
        $0.setAttributedTitle(NSAttributedString(string: "12월", attributes: [.font: UIFont.font(.pretendardMedium, ofSize: 16), .foregroundColor: UIColor.hpGray2]), for: .normal)
    }
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        controlMonthStatus()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    private func configureUI() {
        
        addSubview(containerView)
        
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
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
        let month = sender.currentAttributedTitle?.string
        if let month = month?.components(separatedBy: "월") {
            delegate?.changeMonthStatus(month[0])
        }
        selectedButton?.setAttributedTitle(NSAttributedString(string: selectedButton?.currentAttributedTitle?.string ?? "", attributes: [.font: UIFont.font(.pretendardMedium, ofSize: 16), .foregroundColor: UIColor.hpGray2]), for: .normal)
        sender.setAttributedTitle(NSAttributedString(string: sender.currentAttributedTitle?.string ?? "", attributes: [.font: UIFont.font(.pretendardBold, ofSize: 16), .foregroundColor: UIColor.hpDarkPurple]), for: .normal)
        selectedButton = sender
    }
    
    private func controlMonthStatus() {
        let currentMonth = Calendar.current.component(.month, from: Date())
        [janButton, febButton, marButton, aprButton,
         mayButton, junButton, julButton, augButton,
         sepButton, octButton, novButton, decButton].forEach {
            let monthStr = $0.currentAttributedTitle?.string.components(separatedBy: "월")
            guard let month = monthStr?[0],
                  let selectedMonth = Int(month) else { return }
            if currentMonth < selectedMonth {
                $0.setAttributedTitle(NSAttributedString(string: "\(selectedMonth)월", attributes: [.font: UIFont.font(.pretendardMedium, ofSize: 16), .foregroundColor: UIColor.hpGray7]), for: .normal)
                $0.isEnabled = false
            } else if currentMonth == selectedMonth {
                selectedButton = $0
                $0.setAttributedTitle(NSAttributedString(string: "\(selectedMonth)월", attributes: [.font: UIFont.font(.pretendardBold, ofSize: 16), .foregroundColor: UIColor.hpDarkPurple]), for: .normal)
            }
        }
    }
}
