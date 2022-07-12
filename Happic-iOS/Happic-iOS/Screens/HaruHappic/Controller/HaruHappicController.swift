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
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setCollectionView()
        setCollectionViewLayout()
    }
    
    // MARK: - Functions
    private func configureUI() {
        view.addSubview(addPhotoButton)
        addPhotoButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.trailing.equalToSuperview().inset(30)
            make.width.height.equalTo(20)
        }
    }
    
    private func setCollectionView() {
        
    }
    
    private func setCollectionViewLayout() {
        
    }
}
