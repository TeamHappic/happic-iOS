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
        setViewForType()
        setCollectionView()
        setCollectionViewLayout()
    }
    
    private func setViewForType() {
        switch type {
        case .hourCategory:
            view.backgroundColor = .black
        case .whereCategory:
            view.backgroundColor = .green
        case .whoCategory:
            view.backgroundColor = .purple
        case .whatCategory:
            view.backgroundColor = .brown
        }
    }
    
    private func setCollectionView() {
        rankCollectionView.delegate = self
        rankCollectionView.dataSource = self
        rankCollectionView.register(CategoryDetailCollectionViewCell.self, forCellWithReuseIdentifier: CategoryDetailCollectionViewCell.className)
    }
    
    private func setCollectionViewLayout() {
        view.addSubview(rankCollectionView)
        rankCollectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

// MARK: - Extensions

extension CategoryDetailController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryDetailCollectionViewCell.className, for: indexPath)
                as? CategoryDetailCollectionViewCell else { return UICollectionViewCell() }
        
        return cell
    }
}

extension CategoryDetailController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 60.adjustedH)
    }
}
