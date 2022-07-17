//
//  HourCategoryDetailController.swift
//  Happic-iOS
//
//  Created by sejin on 2022/07/12.
//

import UIKit

enum CategoryType {
    case hourCategory
    case whereCategory
    case whoCategory
    case whatCategory
}

class CategoryDetailController: UIViewController {
    
    // MARK: - Properties
    var type: CategoryType = .hourCategory
    
    // MARK: - UI
    private lazy var rankCollectionView: UICollectionView = {
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
    init(type: CategoryType) {
        self.type = type
        super.init(nibName: nil, bundle: nil)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Functions
    private func configureUI() {
        setCollectionView()
        setCollectionViewLayout()
    }
    
    private func setCollectionView() {
        rankCollectionView.delegate = self
        rankCollectionView.dataSource = self
        rankCollectionView.register(CategoryDetailCollectionViewCell.self,
                                    forCellWithReuseIdentifier: CategoryDetailCollectionViewCell.className)
        rankCollectionView.register(CategoryDetailWithImageCollectionViewCell.self,
                                    forCellWithReuseIdentifier: CategoryDetailWithImageCollectionViewCell.className)
    }
    
    private func setCollectionViewLayout() {
        view.addSubview(rankCollectionView)
        rankCollectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(40)
        }
    }
    
    func collectionViewCanScroll(_ isScrollEnabled: Bool) {
        rankCollectionView.isScrollEnabled = isScrollEnabled
    }
}

// MARK: - Extensions

extension CategoryDetailController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 0 {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CategoryDetailWithImageCollectionViewCell.className, for: indexPath)
                    as? CategoryDetailWithImageCollectionViewCell
            else { return UICollectionViewCell() }
            cell.setCategoryNameLabel(type: type, index: indexPath.row + 1)
            return cell
        }
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryDetailCollectionViewCell.className, for: indexPath)
                as? CategoryDetailCollectionViewCell else { return UICollectionViewCell() }
        cell.setCategoryNameLabel(type: type, index: indexPath.row + 1)
        
        return cell
    }
}

extension CategoryDetailController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: collectionView.frame.width, height: 156)
        }
        return CGSize(width: collectionView.frame.width, height: 60)
    }
}
