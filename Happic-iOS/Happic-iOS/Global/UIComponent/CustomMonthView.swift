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

final class CustomMonthView: UIView {
    
    // MARK: - Properties
    weak var delegate: CustomMonthViewDelegate?
    var isMonthViewEnabled: Bool = false
    
    // MARK: - UI
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
            make.centerY.equalTo(monthLabel)
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
        
        addSubviews(monthPickerView)
        
        monthPickerView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
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
        delegate?.setMonthPickerView(isMonthViewEnabled)
    }
}
