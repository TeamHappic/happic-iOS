//
//  HaruHappicTagViewController.swift
//  Happic-iOS
//
//  Created by devxsby on 2022/07/12.
//

import UIKit

final class HaruHappicTagViewController: UIViewController {
    
    // MARK: - UI
    private lazy var customMonthView = CustomMonthView()
    private lazy var customMonthPickerView = CustomMonthPickerView()
    private lazy var containerCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isScrollEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setCollectionView()
    }
    
    // MARK: - Functions
    private func configureUI() {
        
        view.addSubviews(containerCollectionView, customMonthView, customMonthPickerView)
        
        customMonthView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.leading.trailing.equalToSuperview().inset(100)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
        }
        
        containerCollectionView.snp.makeConstraints { make in
            make.top.equalTo(customMonthView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(10)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        customMonthPickerView.snp.makeConstraints { make in
            make.top.equalTo(customMonthView.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(10)
            make.height.equalTo(230)
        }
    
    private func setCollectionView() {
        containerCollectionView.delegate = self
        containerCollectionView.dataSource = self
        containerCollectionView.register(TagCollectionViewCell.self, forCellWithReuseIdentifier: TagCollectionViewCell.className)
    }
}

// MARK: - Extensions
extension HaruHappicTagViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCollectionViewCell.className, for: indexPath)
                as? TagCollectionViewCell else { return UICollectionViewCell()}
        return cell
    }
}

extension HaruHappicTagViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 75)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}
