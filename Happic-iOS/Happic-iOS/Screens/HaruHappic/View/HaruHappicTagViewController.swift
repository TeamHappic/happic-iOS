//
//  HaruHappicTagViewController.swift
//  Happic-iOS
//
//  Created by devxsby on 2022/07/12.
//

import UIKit

final class HaruHappicTagViewController: UIViewController {

    // MARK: - UI
    private lazy var monthSelectorButton = UIButton(type: .system).then {
        $0.setTitle("2022.06", for: .normal)
        $0.setTitleColor(.hpWhite, for: .normal)
        $0.titleLabel?.font = UIFont.font(.gmarketSansBold, ofSize: 16)
    }
    
    private lazy var monthSelectorArrowImage = UIImageView().then {
        $0.image = ImageLiteral.icnArrowMore
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.backgroundColor = .black
        $0.tintColor = .white
    }

    private lazy var containerCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isScrollEnabled = true
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
        
        view.addSubviews(monthSelectorButton, monthSelectorArrowImage, containerCollectionView)
        
        monthSelectorButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.centerX.equalToSuperview()
        }
        
        monthSelectorArrowImage.snp.makeConstraints { make in
            make.leading.equalTo(monthSelectorButton.snp.trailing).offset(10)
            make.centerY.equalTo(monthSelectorButton)
            make.width.height.equalTo(12)
        }
        
        containerCollectionView.snp.makeConstraints { make in
            make.top.equalTo(monthSelectorButton.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(10)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
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
