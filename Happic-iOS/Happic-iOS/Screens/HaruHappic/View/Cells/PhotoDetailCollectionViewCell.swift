//
//  PhotoDetailCollectionViewCell.swift
//  Happic-iOS
//
//  Created by devxsby on 2022/07/19.
//

import UIKit

final class PhotoDetailCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI
    private lazy var dailyImage = UIImageView().then {
        $0.image = ImageLiterals.imageDailySample4
        $0.layer.cornerRadius = 12
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
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
        
        addSubview(dailyImage)
        
        dailyImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
