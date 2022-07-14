//
//  CustomMonthView.swift
//  Happic-iOS
//
//  Created by devxsby on 2022/07/13.
//

import UIKit

protocol CustomMonthViewDelegate: AnyObject {
    func setMonthPickerView(_ isMonthViewEnabled: Bool)
}

    
    // MARK: - Properties
    var isMonthViewEnabled: Bool = false
    
    // MARK: - UI
    private lazy var customMonthPickerView = CustomMonthPickerView()
    
    private lazy var monthLabel = UILabel().then {
        $0.text = "2022 . 06"
        $0.textColor = .hpWhite
        $0.font = UIFont.font(.gmarketSansBold, ofSize: 16)
    }
    
    private lazy var monthSelectorArrowImage = UIImageView().then {
        $0.image = ImageLiteral.icnArrowMore
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.backgroundColor = .black
        $0.tintColor = .white
    }
    
    private lazy var monthPickerView = UIView().then {
        $0.addSubviews(monthLabel, monthSelectorArrowImage)
        
        monthLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }

        monthSelectorArrowImage.snp.makeConstraints { make in
            make.width.height.equalTo(12)
            make.leading.equalTo(monthLabel.snp.trailing).offset(10)
            make.centerY.equalToSuperview()
        }
    }
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        setTapGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    private func configureUI() {
        
        addSubviews(monthPickerView, customMonthPickerView)
        
        monthPickerView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(5)
        }
        
        customMonthPickerView.snp.makeConstraints { make in
            make.top.equalTo(monthPickerView.snp.bottom)
            make.centerX.equalTo(monthPickerView)
            make.width.equalTo(335)
            make.height.equalTo(230)
        }
        customMonthPickerView.isHidden = true
    }
    
    private func setTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        monthPickerView.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        setCustomPickerView()
    }
    
    private func setCustomPickerView() {
        
        isMonthViewEnabled.toggle()
        
        if isMonthViewEnabled == true {
            customMonthPickerView.isHidden = false
        } else {
            customMonthPickerView.isHidden = true
        }
    }
}
