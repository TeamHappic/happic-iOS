//
//  CalendarCollectionViewCell.swift
//  Happic-iOS
//
//  Created by sejin on 2022/07/13.
//

import UIKit

class CalendarCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI
    let dayLabel = UILabel().then {
        $0.text = "1"
        $0.font = UIFont.font(.pretendardBold, ofSize: 12)
        $0.textColor = .white
    }
    
    private lazy var uploadCheckView = UIView().then {
        $0.backgroundColor = .darkGray
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
        backgroundColor = .hpBgBlack2
        
        addSubviews(uploadCheckView, dayLabel)
        dayLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        uploadCheckView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalToSuperview()
            make.width.equalTo(snp.height)
        }
        
        uploadCheckView.layer.cornerRadius = self.frame.size.height / 2
        uploadCheckView.clipsToBounds = true
        uploadCheckView.isHidden = true
    }
    
    func showUploadCheckView() {
        uploadCheckView.isHidden = false
    }
    
    func hideUploadCheckView() {
        uploadCheckView.isHidden = true
    }
}
