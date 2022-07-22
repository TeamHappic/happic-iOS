//
//  CategoryDetailController.swift
//  Happic-iOS
//
//  Created by sejin on 2022/07/12.
//

import UIKit

enum CategoryType {
    case whenCategory
    case whereCategory
    case whoCategory
    case whatCategory
}

class CategoryDetailController: UIViewController {
    
    // MARK: - Properties
    var type: CategoryType = .whenCategory
    var models = [KeywordModel]()
    
    // MARK: - UI
    private lazy var containerView = UIView().then {
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    
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
        view.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.leading.bottom.trailing.equalTo(view.safeAreaLayoutGuide)
        }
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
        containerView.addSubview(rankCollectionView)
        rankCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func collectionViewCanScroll(_ isScrollEnabled: Bool) {
        rankCollectionView.isScrollEnabled = isScrollEnabled
    }
}

// MARK: - Extensions

extension CategoryDetailController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 0 {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CategoryDetailWithImageCollectionViewCell.className, for: indexPath)
                    as? CategoryDetailWithImageCollectionViewCell
            else { return UICollectionViewCell() }
            cell.setCategoryNameLabel(type: type, index: indexPath.row + 1)
            cell.setData(model: models[indexPath.row])
            return cell
        }
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryDetailCollectionViewCell.className, for: indexPath)
                as? CategoryDetailCollectionViewCell else { return UICollectionViewCell() }
        cell.setCategoryNameLabel(type: type, index: indexPath.row + 1)
        cell.setData(model: models[indexPath.row])
        return cell
    }
    
    func setData(model: [KeywordModel]) {
        if model.isEmpty {
            containerView.showNoneKeywordView()
        } else {
            containerView.hideNoneKeywordView()
            models = model
            rankCollectionView.reloadData()
        }
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
