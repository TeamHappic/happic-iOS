//
//  HaruHappicDetailController.swift
//  Happic-iOS
//
//  Created by devxsby on 2022/07/19.
//

import UIKit

final class HaruHappicDetailController: UIViewController {
    
    // MARK: - Properties
    let cellSize = CGSize(width: 300, height: 300)
    var minItemSpacing: CGFloat = 5
    let cellCount = 5
    var previousIndex: Int = 0
    
    // MARK: - UI
    private lazy var headerView = UIView()
    
    private lazy var backButton = UIButton(type: .system).then {
        $0.setImage(ImageLiterals.icnLeft, for: .normal)
        $0.tintColor = .hpWhite
        $0.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        $0.addTarget(self, action: #selector(popViewController), for: .touchUpInside)
    }
    
    private lazy var deleteButton = UIButton(type: .system).then {
        $0.setImage(ImageLiterals.icnTrash, for: .normal)
        $0.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        //        $0.addTarget(self, action: #selector(), for: .touchUpInside)
    }
    
    private lazy var dateLabel = UILabel().then {
        $0.text = "2022 . 07 . 20"
        $0.textColor = .hpWhite
        $0.font = UIFont.font(.pretendardBold, ofSize: 16)
    }
    
    private lazy var photoCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = minItemSpacing
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isScrollEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private lazy var whenLabel = UILabel().then {
        $0.text = "#오후2시"
    }
    
    private lazy var whereLabel = UILabel().then {
        $0.text = "#집구석구석"
    }
    
    private lazy var whoLabel = UILabel().then {
        $0.text = "#햄식달식이"
    }
    
    private lazy var whatLabel = UILabel().then {
        $0.text = "#짱짱귀여워"
    }
    
    private lazy var tagStackView = UIStackView(arrangedSubviews: [whenLabel, whereLabel, whoLabel, whatLabel]).then {
        $0.axis = .horizontal
        $0.distribution = .equalSpacing
        $0.spacing = 5
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Functions
    private func configureUI() {
        setPurpleBackgroundColor()
        setHeaderView()
        setImageCollectionView()
        setBottomTagView()
    }
    
    private func setHeaderView() {
        
        view.addSubview(headerView)
        headerView.addSubviews(backButton, dateLabel, deleteButton)
        
        headerView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(150)
        }
        
        backButton.snp.makeConstraints { make in
            make.top.equalTo(headerView).offset(10)
            make.leading.equalTo(headerView.snp.leading).offset(20)
            make.width.height.equalTo(48)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(10)
        }
        
        deleteButton.snp.makeConstraints { make in
            make.centerY.equalTo(dateLabel)
            make.trailing.equalToSuperview().inset(20)
            make.width.height.equalTo(48)
        }
    }
    
    private func setImageCollectionView() {
        
        photoCollectionView.delegate = self
        photoCollectionView.dataSource = self
        photoCollectionView.register(PhotoDetailCollectionViewCell.self, forCellWithReuseIdentifier: PhotoDetailCollectionViewCell.className)
        
        view.addSubview(photoCollectionView)
        photoCollectionView.backgroundColor = .clear
        
        photoCollectionView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(300)
        }
        
        photoCollectionView.contentInsetAdjustmentBehavior = .never
        let cellWidth: CGFloat = floor(cellSize.width)
        print(cellWidth)
        let insetX = (view.frame.width - cellWidth) / 2.0
        print(insetX)
        photoCollectionView.contentInset = UIEdgeInsets(top: 0, left: insetX, bottom: 0, right: insetX)
        print(photoCollectionView.contentInset)
        photoCollectionView.decelerationRate = .fast
    }
    
    private func setBottomTagView() {
        
        view.addSubview(tagStackView)
        
        [whenLabel, whereLabel, whoLabel, whatLabel].forEach {
            $0.textColor = .hpGray2
            $0.font = UIFont.font(.pretendardMedium, ofSize: 14)
            $0.textAlignment = .left
        }
        
        tagStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(40)
            make.top.equalTo(photoCollectionView.snp.bottom).offset(30)
        }
    }
    
    @objc private func popViewController() {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - Extensions
extension HaruHappicDetailController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoDetailCollectionViewCell.className, for: indexPath)
                as? PhotoDetailCollectionViewCell else { return UICollectionViewCell() }
        if indexPath.row == 1 {
            animateZoomforCellremove(zoomCell: cell)
        }
        return cell
    }
}

extension HaruHappicDetailController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return cellSize
    }
    
    // MARK: Paging Effect
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let cellWidthIncludeSpacing = cellSize.width + minItemSpacing
        
        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludeSpacing
        let roundedIndex: CGFloat = round(index)
        
        offset = CGPoint(x: roundedIndex * cellWidthIncludeSpacing - scrollView.contentInset.left, y: scrollView.contentInset.top)
        targetContentOffset.pointee = offset
    }
    
    // MARK: Carousel Effect
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let cellWidthIncludeSpacing = cellSize.width + minItemSpacing
        let offsetX = photoCollectionView.contentOffset.x
        let index = (offsetX + photoCollectionView.contentInset.left) / cellWidthIncludeSpacing
        let roundedIndex = round(index)
        let indexPath = IndexPath(item: Int(roundedIndex), section: 0)
        if let cell = photoCollectionView.cellForItem(at: indexPath) {
            animateZoomforCell(zoomCell: cell)
        }
        
        if Int(roundedIndex) == 0 {
            let secondCellPath = IndexPath(item: 1, section: 0)
            if let cell = photoCollectionView.cellForItem(at: secondCellPath) {
                animateZoomforCellremove(zoomCell: cell)
            }
        }
        
        if Int(roundedIndex) == cellCount - 1 {
            let lastCellPath = IndexPath(item: cellCount - 1, section: 0)
            let preCellPath = IndexPath(item: cellCount - 2, section: 0)
            if let cell = photoCollectionView.cellForItem(at: lastCellPath),
               let preCell = photoCollectionView.cellForItem(at: preCellPath) {
                animateZoomforCellremove(zoomCell: preCell)
                animateZoomforCell(zoomCell: cell)
            }
        }
        
        if Int(roundedIndex) < previousIndex {
            let preIndexPath = IndexPath(item: previousIndex-2, section: 0)
            let nextIndexPath = IndexPath(item: previousIndex, section: 0)
            print(preIndexPath, previousIndex, nextIndexPath)
            if let preCell = photoCollectionView.cellForItem(at: preIndexPath),
               let nextCell = photoCollectionView.cellForItem(at: nextIndexPath) {
                animateZoomforCellremove(zoomCell: preCell)
                animateZoomforCellremove(zoomCell: nextCell)
            }
            previousIndex = indexPath.item
            print(previousIndex)
        }
        
        if Int(roundedIndex) > previousIndex {
            let preIndexPath = IndexPath(item: previousIndex, section: 0)
            let nextIndexPath = IndexPath(item: previousIndex+2, section: 0)
            print(preIndexPath, previousIndex, nextIndexPath)
            if let preCell = photoCollectionView.cellForItem(at: preIndexPath),
               let nextCell = photoCollectionView.cellForItem(at: nextIndexPath) {
                animateZoomforCellremove(zoomCell: preCell)
                animateZoomforCellremove(zoomCell: nextCell)
            }
            
            previousIndex = indexPath.item
            print(previousIndex)
        }
    }
    
    func animateZoomforCell(zoomCell: UICollectionViewCell) {
        UIView.animate(
            withDuration: 0.2,
            delay: 0,
            options: .curveEaseOut,
            animations: {
                zoomCell.transform = .identity
            },
            completion: nil)
    }
    
    func animateZoomforCellremove(zoomCell: UICollectionViewCell) {
        UIView.animate(
            withDuration: 0.2,
            delay: 0,
            options: .curveEaseOut,
            animations: {
                zoomCell.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            },
            completion: nil)
    }
}
