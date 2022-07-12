//
//  KeywordRankCollectionViewCell.swift
//  Happic-iOS
//
//  Created by sejin on 2022/07/12.
//

import UIKit

final class KeywordRankCollectionViewCell: UICollectionViewCell {
    // MARK: - UI
    
    // MARK: - View Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    private func configureUI() {
        backgroundColor = .hp_gray8
    }
}
