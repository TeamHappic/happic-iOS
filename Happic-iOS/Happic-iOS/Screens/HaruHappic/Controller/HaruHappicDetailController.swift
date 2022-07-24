//
//  HaruHappicDetailController.swift
//  Happic-iOS
//
//  Created by devxsby on 2022/07/19.
//

import UIKit

final class HaruHappicDetailController: UIViewController {
    
    // MARK: - Properties
    var models = [HaruHappicModel]()
    let cellSize = CGSize(width: 300, height: 300)
    var minItemSpacing: CGFloat = 5
    var previousIndex: Int = 0 {
        didSet {
            dateLabel.text = "2022." + "07." + "\(models[previousIndex].day)"

            whenLabel.text = "#" + "\(models[previousIndex].when)".timeFormatted
            whereLabel.text = "#" + models[previousIndex].place
            whoLabel.text = "#" + models[previousIndex].who
            whatLabel.text = "#" + models[previousIndex].what
            
            if models[previousIndex].day < 10 {
                dateLabel.text = "2022." + "07.0" + "\(models[previousIndex].day)"
            }
        }
    }
    
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
        $0.addTarget(self, action: #selector(showAlertPopUp), for: .touchUpInside)
    }
    
    private lazy var dateLabel = UILabel().then {
        $0.text = "2022 . 07 . 20"
        $0.textColor = .hpWhite
        $0.font = UIFont.font(.pretendardBold, ofSize: 18)
    }
    
    private lazy var photoCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = minItemSpacing
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isScrollEnabled = true
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
        setDelegate()
    }
    
    // MARK: - Functions
    private func configureUI() {
        setPurpleBackgroundColor()
        setHeaderView()
        setImageCollectionView()
        setBottomTagView()
    }
    
    private func setDelegate() {
        photoCollectionView.delegate = self
        photoCollectionView.dataSource = self
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
        
        photoCollectionView.register(PhotoDetailCollectionViewCell.self, forCellWithReuseIdentifier: PhotoDetailCollectionViewCell.className)
        
        view.addSubview(photoCollectionView)
        photoCollectionView.backgroundColor = .clear
        
        photoCollectionView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(300)
        }
        
        photoCollectionView.contentInsetAdjustmentBehavior = .never
        let cellWidth: CGFloat = floor(cellSize.width)
        let insetX = (view.frame.width - cellWidth) / 2.0
        photoCollectionView.contentInset = UIEdgeInsets(top: 0, left: insetX, bottom: 0, right: insetX)
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
    
    @objc private func showAlertPopUp() {
        let alartPopUpView = CustomPopUpController()
        alartPopUpView.id = models[previousIndex].id
        alartPopUpView.setPopUpText(title: "해픽 삭제",
                                    contents: "사진 삭제시 사진과 태그가 모두 지워집니다.\n또한 해당 내용은 복구가 불가능합니다.\n삭제하시겠습니까?",
                                    firstButtonTitle: "취소",
                                    secondButtonTitle: "삭제하기")
        alartPopUpView.modalTransitionStyle = .crossDissolve
        alartPopUpView.modalPresentationStyle = .overFullScreen
        present(alartPopUpView, animated: true)
    }
    
    func setData(models: [HaruHappicModel], index: Int) {
        self.models = models
        photoCollectionView.reloadData()
        photoCollectionView.layoutIfNeeded()
        
        DispatchQueue.main.async {
            if let _ = self.photoCollectionView.dataSource?.collectionView(self.photoCollectionView, cellForItemAt: IndexPath(row: 0, section: 0)) {
                self.photoCollectionView.scrollToItem(at: IndexPath(row: index, section: 0), at: .centeredHorizontally, animated: true)
            }
        }
        dateLabel.text = "2022." + "07." + "\(models[index].day)"

        whenLabel.text = "#" + "\(models[index].when)".timeFormatted
        whereLabel.text = "#" + models[index].place
        whoLabel.text = "#" + models[index].who
        whatLabel.text = "#" + models[index].what
        
        if models[index].day < 10 {
            dateLabel.text = "2022." + "07.0" + "\(models[index].day)"
        }
    }
}

// MARK: - Extensions
extension HaruHappicDetailController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoDetailCollectionViewCell.className, for: indexPath)
                as? PhotoDetailCollectionViewCell else { return UICollectionViewCell() }
        cell.setData(model: models[indexPath.row])
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
    
    // Paging Effect
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let cellWidthIncludeSpacing = cellSize.width + minItemSpacing
        
        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludeSpacing
        let roundedIndex: CGFloat = round(index)
        
        offset = CGPoint(x: roundedIndex * cellWidthIncludeSpacing - scrollView.contentInset.left, y: scrollView.contentInset.top)
        targetContentOffset.pointee = offset
    }
    
    // Carousel Effect
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
        
        if Int(roundedIndex) == models.count - 1 {
            let lastCellPath = IndexPath(item: models.count - 1, section: 0)
            let preCellPath = IndexPath(item: models.count - 2, section: 0)
            if let cell = photoCollectionView.cellForItem(at: lastCellPath),
               let preCell = photoCollectionView.cellForItem(at: preCellPath) {
                animateZoomforCellremove(zoomCell: preCell)
                animateZoomforCell(zoomCell: cell)
            }
        }
        
        if Int(roundedIndex) < previousIndex {
            let preIndexPath = IndexPath(item: previousIndex-2, section: 0)
            let nextIndexPath = IndexPath(item: previousIndex, section: 0)
            if let preCell = photoCollectionView.cellForItem(at: preIndexPath),
               let nextCell = photoCollectionView.cellForItem(at: nextIndexPath) {
                animateZoomforCellremove(zoomCell: preCell)
                animateZoomforCellremove(zoomCell: nextCell)
            }
            previousIndex = indexPath.item
        }
        
        if Int(roundedIndex) > previousIndex {
            let preIndexPath = IndexPath(item: previousIndex, section: 0)
            let nextIndexPath = IndexPath(item: previousIndex+2, section: 0)
            if let preCell = photoCollectionView.cellForItem(at: preIndexPath),
               let nextCell = photoCollectionView.cellForItem(at: nextIndexPath) {
                animateZoomforCellremove(zoomCell: preCell)
                animateZoomforCellremove(zoomCell: nextCell)
            }
            previousIndex = indexPath.item
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
