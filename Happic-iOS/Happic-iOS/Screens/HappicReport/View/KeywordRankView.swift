//
//  KeywordRankView.swift
//  Happic-iOS
//
//  Created by sejin on 2022/07/12.
//

import UIKit

final class KeywordRankView: UIView {
    // MARK: - Properties
    var models = [Rank2]()

    // MARK: - UI
    let headerView = HappicReportSectionHeader(type: .keywordRank)
    
    private let containerView = UIView().then {
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
    }

    private lazy var keywordCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isScrollEnabled = false
        collectionView.backgroundColor = UIColor.clear
        return collectionView
    }()
    
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
        setHeaderView()
        setCollectionView()
        setCollectionViewLayout()
    }
    
    private func setHeaderView() {
        addSubviews(headerView)
        headerView.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
        }
    }
    
    private func setCollectionView() {
        keywordCollectionView.delegate = self
        keywordCollectionView.dataSource = self
        keywordCollectionView.register(KeywordRankCollectionViewCell.self, forCellWithReuseIdentifier: KeywordRankCollectionViewCell.className)
    }
    
    private func setCollectionViewLayout() {
        addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom)
            make.leading.bottom.trailing.equalToSuperview()
        }
        
        containerView.addSubview(keywordCollectionView)
        keywordCollectionView.snp.makeConstraints { make in
            make.leading.top.bottom.trailing.equalToSuperview()
        }
    }
    
    func collectionViewCanScroll(_ isScrollEnabled: Bool) {
        keywordCollectionView.isScrollEnabled = isScrollEnabled
    }
    
    func setData(model: [Rank2]) {
        models = model
        keywordCollectionView.reloadData()
    }
}

// MARK: - Extensions

extension KeywordRankView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KeywordRankCollectionViewCell.className, for: indexPath)
                as? KeywordRankCollectionViewCell else { return UICollectionViewCell()}
        cell.setData(rank: indexPath.row + 1, model: models[indexPath.row])
        return cell
    }
}

extension KeywordRankView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 60)
    }
}
