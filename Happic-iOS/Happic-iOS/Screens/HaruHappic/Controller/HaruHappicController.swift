//
//  HaruHappicController.swift
//  Happic-iOS
//
//  Created by devxsby on 2022/07/12.
//

import UIKit

final class HaruHappicController: UIViewController {
    
    // MARK: - UI
    private lazy var addPhotoButton = UIButton(type: .system).then {
        $0.setImage(ImageLiteral.icnAddPhoto, for: .normal)
        $0.tintColor = .white
    }
    
    private lazy var haruHappicViewPager = CustomViewPager(viewControllers: [HaruHappicPhotoController(), HaruHappicTagViewController()], buttonTitles: ["사진", "태그"], barHeight: 34, indicatorWeight: 4, isScrollEnabled: true)
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setCollectionView()
        setCollectionViewLayout()
    }
    
    // MARK: - Functions
    private func configureUI() {
        view.addSubviews(addPhotoButton, haruHappicViewPager)

        addPhotoButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.trailing.equalToSuperview().inset(30)
            make.width.height.equalTo(20)
        }
        
        haruHappicViewPager.snp.makeConstraints { make in
            make.top.equalTo(addPhotoButton.snp.bottom).offset(24)
            make.leading.trailing.equalToSuperview().inset(10)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func setCollectionView() {
        
    }
    
    private func setCollectionViewLayout() {
        
    }
}
