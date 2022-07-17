//
//  HaruHappicController.swift
//  Happic-iOS
//
//  Created by devxsby on 2022/07/12.
//

import UIKit

final class HaruHappicController: BaseUploadViewController {
    
    // MARK: - UI
    private lazy var addPhotoButton = UIButton(type: .system).then {
        $0.setImage(ImageLiterals.icnPlus, for: .normal)
        $0.tintColor = .white
        $0.addTarget(self, action: #selector(addPhotoButtonDidTap), for: .touchUpInside)
    }
    
    private lazy var haruHappicViewPager = CustomViewPager(viewControllers: [HaruHappicPhotoController(), HaruHappicTagController()], buttonTitles: ["사진", "태그"], buttonFontSize: 16, barHeight: 34, indicatorWeight: 4, isScrollEnabled: true)
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
//        showToast(message: "이미 오늘의 해픽을 등록했어요")
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
    
    @objc private func addPhotoButtonDidTap() {
        setActionSheet()
    }
}
