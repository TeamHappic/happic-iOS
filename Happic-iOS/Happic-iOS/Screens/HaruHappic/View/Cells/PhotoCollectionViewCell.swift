//
//  PhotoCollectionViewCell.swift
//  Happic-iOS
//
//  Created by devxsby on 2022/07/12.
//

import UIKit

final class PhotoCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI
    private lazy var dailyImage = UIImageView().then {
        $0.layer.cornerRadius = 8
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    
    private lazy var dailyLabel = UILabel().then {
        $0.text = "1"
        $0.textColor = .hpWhite
        $0.font = UIFont.font(.pretendardMedium, ofSize: 13)
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
        
        addSubviews(dailyLabel, dailyImage)
        
        dailyImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.height.equalTo(self.frame.width)
        }
        
        dailyLabel.snp.makeConstraints { make in
            make.top.equalTo(dailyImage.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
    }
    
    func setData(model: HaruHappicModel) {
        let date = Date()
        let todayDay = Calendar.current.dateComponents([.day], from: date)
        
        dailyImage.setImage(with: model.thumbnail)
        dailyLabel.text = "\(model.day)"
        
        if Int(dailyLabel.text!) == todayDay.day {
            dailyImage.layer.borderColor = UIColor.hpOrange.cgColor
            dailyImage.layer.borderWidth = 1
            dailyLabel.textColor = .hpOrange
        } else {
            dailyImage.layer.borderColor = UIColor.black.cgColor
            dailyImage.layer.borderWidth = 1
            dailyLabel.textColor = .hpWhite
        }
    }
}
