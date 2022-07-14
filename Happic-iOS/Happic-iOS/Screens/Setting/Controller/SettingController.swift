//
//  SettingController.swift
//  Happic-iOS
//
//  Created by sejin on 2022/07/08.
//

import UIKit

final class SettingController: UIViewController {
    
    // MARK: - UI
    private lazy var settingCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .hpBgBlack1
        return collectionView
    }()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setDelegate()
        setCollectionView()
    }
    
    // MARK: - Functions
    private func configureUI() {
        view.backgroundColor = UIColor.hpBgBlack1
        
        view.addSubview(settingCollectionView)
        settingCollectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func setDelegate() {
        settingCollectionView.delegate = self
        settingCollectionView.dataSource = self
    }
    
    private func setCollectionView() {
        settingCollectionView.register(SettingCollectionViewCell.self, forCellWithReuseIdentifier: SettingCollectionViewCell.className)
        settingCollectionView.register(SettingSectionHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SettingSectionHeaderCollectionReusableView.className)
    }
}

// MARK: - Extensions
extension SettingController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SettingSectionHeaderCollectionReusableView.className, for: indexPath) as? SettingSectionHeaderCollectionReusableView else { return UICollectionReusableView() }
            
            if indexPath.section == 1 {
                header.sectionTitleLabel.text = "앱 정보"
            }
            
            return header
        }
        return UICollectionReusableView()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 0 ? 1 : 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let settingTitles = ["서비스 이용약관", "개인정보 처리방침", "오픈소스 라이센스", "개발자 연락처"]
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SettingCollectionViewCell.className, for: indexPath)
                as? SettingCollectionViewCell
        else { return UICollectionViewCell() }
        
        if indexPath.section == 1 {
            cell.settingNameLabel.text = settingTitles[indexPath.row]
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0 && indexPath.row == 0 {
            let CharacterChangePopUpView = CustomPopUpController()
            CharacterChangePopUpView.modalTransitionStyle = .crossDissolve
            CharacterChangePopUpView.modalPresentationStyle = .overFullScreen
            present(CharacterChangePopUpView, animated: true)
        }
    }
}

extension SettingController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 48)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 48)
    }
}
