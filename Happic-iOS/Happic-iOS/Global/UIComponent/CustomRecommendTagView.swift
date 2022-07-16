//
//  CustomRecommendTagView.swift
//  Happic-iOS
//
//  Created by devxsby on 2022/07/16.
//

import UIKit

final class CustomRecommendTagView: UIView {
    
    // MARK: - UI
    private lazy var tagLabel = UILabel().then {
        $0.text = "#when"
        $0.textColor = .hpGray4
        $0.font = UIFont.font(.pretendardBold, ofSize: 14)
    }
    
    private lazy var verticalLine = UIView().then {
        $0.tintColor = .hpGray7
    }
    
    private lazy var userTextField = UITextField().then {
        $0.placeholder = "시간을 입력해주세요"
        $0.attributedPlaceholder = NSAttributedString(string: "장소를 입력해주세요", attributes: [.foregroundColor: UIColor.hpGray6])
        $0.textColor = .hpGray1
        $0.font = UIFont.font(.pretendardMedium, ofSize: 14)
        $0.returnKeyType = .done
        $0.delegate = self
    }
    
    private lazy var textFieldContainerView = UIView().then {
        $0.backgroundColor = .hpGray9
        $0.addSubviews(tagLabel, verticalLine, userTextField)
        
        tagLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(25)
            make.centerY.equalToSuperview()
        }
        
        verticalLine.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(100)
            make.centerY.equalToSuperview()
            make.width.equalTo(1)
            make.height.equalTo(24)
        }
        
        userTextField.snp.makeConstraints { make in
            make.leading.equalTo(verticalLine.snp.trailing).offset(16)
            make.centerY.equalToSuperview()
        }
    }
    
    private lazy var tagButton1 = UIButton(type: .system).then {
        $0.backgroundColor = .hpGray9
        $0.setTitle("안녕1", for: .normal)
        $0.setTitleColor(.hpGray4, for: .normal)
        $0.layer.cornerRadius = 18
    }
    
    private lazy var tagButton2 = UIButton(type: .system).then {
        $0.backgroundColor = .hpGray9
        $0.setTitle("안녕2", for: .normal)
        $0.setTitleColor(.hpGray4, for: .normal)
        $0.layer.cornerRadius = 18
    }
    
    private lazy var tagButton3 = UIButton(type: .system).then {
        $0.backgroundColor = .hpGray9
        $0.setTitle("안녕3", for: .normal)
        $0.setTitleColor(.hpGray4, for: .normal)
        $0.layer.cornerRadius = 18
    }
    
    private lazy var tagButton4 = UIButton(type: .system).then {
        $0.backgroundColor = .hpGray9
        $0.setTitle("안녕4", for: .normal)
        $0.setTitleColor(.hpGray4, for: .normal)
        $0.layer.cornerRadius = 18
    }
    
    private lazy var tagButton5 = UIButton(type: .system).then {
        $0.backgroundColor = .hpGray9
        $0.setTitle("안녕5", for: .normal)
        $0.setTitleColor(.hpGray4, for: .normal)
        $0.layer.cornerRadius = 18
    }
    
    private lazy var tagButton6 = UIButton(type: .system).then {
        $0.backgroundColor = .hpGray9
        $0.setTitle("안녕6", for: .normal)
        $0.setTitleColor(.hpGray4, for: .normal)
        $0.layer.cornerRadius = 18
    }
    
    private lazy var tagButton7 = UIButton(type: .system).then {
        $0.backgroundColor = .hpGray9
        $0.setTitle("안녕7", for: .normal)
        $0.setTitleColor(.hpGray4, for: .normal)
        $0.layer.cornerRadius = 18
    }
    
    private lazy var tagButton8 = UIButton(type: .system).then {
        $0.backgroundColor = .hpGray9
        $0.setTitle("안녕8", for: .normal)
        $0.setTitleColor(.hpGray4, for: .normal)
        $0.layer.cornerRadius = 18
    }
    
    private lazy var tagButton9 = UIButton(type: .system).then {
        $0.backgroundColor = .hpGray9
        $0.setTitle("안녕9", for: .normal)
        $0.setTitleColor(.hpGray4, for: .normal)
        $0.layer.cornerRadius = 18
    }
    
    private lazy var tagContainerView = UIView().then {
        $0.backgroundColor = .hpBgBlack2h
        
        let tagStack1 = UIStackView(arrangedSubviews: [tagButton1, tagButton2, tagButton3])
        let tagStack2 = UIStackView(arrangedSubviews: [tagButton4, tagButton5, tagButton6])
        let tagStack3 = UIStackView(arrangedSubviews: [tagButton7, tagButton8, tagButton9])
        let stacks: [UIStackView] = [tagStack1, tagStack2, tagStack3]
        
        tagButton1.snp.makeConstraints { make in
            make.height.equalTo(36)
        }
        
        tagButton4.snp.makeConstraints { make in
            make.height.equalTo(36)
        }
        
        tagButton7.snp.makeConstraints { make in
            make.height.equalTo(36)
        }
        
        for stack in stacks {
            stack.axis = .horizontal
            stack.spacing = 12
            stack.distribution = .fillEqually
        }
        
        let tagStacks = UIStackView(arrangedSubviews: [tagStack1, tagStack2, tagStack3])
        
        $0.addSubview(tagStacks)
        tagStacks.axis = .vertical
        tagStacks.spacing = 10
        tagStacks.distribution = .fillEqually
        
        tagStacks.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(22)
        }
    }
    
    private lazy var containerStackView = UIStackView(arrangedSubviews: [textFieldContainerView, tagContainerView]).then {
        $0.axis = .vertical
        $0.spacing = 0
        textFieldContainerView.snp.makeConstraints { make in
            make.height.equalTo(48)
        }
        
        tagContainerView.snp.makeConstraints { make in
            make.height.equalTo(150)
        }
        tagContainerView.isHidden = true
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
        
        layer.cornerRadius = 10
        clipsToBounds = true
        
        addSubviews(containerStackView)
        
        containerStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(1)
        }
        
        [tagButton1, tagButton2, tagButton3, tagButton4, tagButton5, tagButton6, tagButton7, tagButton8, tagButton9].forEach {
            $0.addTarget(self, action: #selector(tagButtonDidtap(sender: )), for: .touchUpInside)
        }
    }
    
    @objc func tagButtonDidtap(sender: UIButton) {
        userTextField.text = sender.currentTitle
    }
}

// MARK: - Extensions
extension CustomRecommendTagView: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        UIView.animate(withDuration: 0.2) {
            self.tagContainerView.isHidden = false
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.2) {
            self.tagContainerView.isHidden = true
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
