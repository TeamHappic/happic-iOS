//
//  HaruHappicController.swift
//  Happic-iOS
//
//  Created by devxsby on 2022/07/12.
//

import UIKit

final class HaruHappicController: BaseUploadViewController {
    
    // MARK: - Properties
    var models = [HaruHappicModel]()
    private lazy var currentMonth: String = setCurrentMonth()
    private lazy var haruHappicPhotoController = HaruHappicPhotoController()
    private lazy var haruHappicTagController = HaruHappicTagController()
    
    // MARK: - UI
    private lazy var addPhotoButton = UIButton(type: .system).then {
        $0.setImage(ImageLiterals.icnPlus, for: .normal)
        $0.addTarget(self, action: #selector(addPhotoButtonDidTap), for: .touchUpInside)
    }
    
    private lazy var haruHappicViewPager = CustomViewPager(viewControllers: [haruHappicPhotoController, haruHappicTagController], buttonTitles: ["사진", "태그"], buttonFontSize: 16, barHeight: 34, indicatorWeight: 4, isScrollEnabled: true)
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setDelegate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getHaruHappicPhoto(year: 2022, month: Int(currentMonth)!)
    }
    
    // MARK: - Functions
    private func configureUI() {
        
        setPurpleBackgroundColor()
        
        view.addSubviews(addPhotoButton, haruHappicViewPager)
        
        addPhotoButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.trailing.equalToSuperview().inset(30)
            make.width.height.equalTo(20)
        }
        
        haruHappicViewPager.snp.makeConstraints { make in
            make.top.equalTo(addPhotoButton.snp.bottom).offset(24)
            make.leading.trailing.equalToSuperview().inset(10)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
    }
    
    @objc private func addPhotoButtonDidTap() {
        checkPostStatus()
    }
    
    private func setDelegate() {
        haruHappicPhotoController.delegate = self
        haruHappicTagController.delegate = self
    }
    
    private func setCurrentMonth() -> String {
        let date = Date()
        let todayMonth = Calendar.current.dateComponents([.month], from: date)
        return String(todayMonth.month ?? 7)
    }
}

// MARK: - Extensions
extension HaruHappicController: HaruHappicPhotoControllerDelegate, HaruHappicTagControllerDelegate {
    func showDetailView(index: Int) {
        let detailViewController = HaruHappicDetailController()
        detailViewController.setData(models: models, index: index, month: currentMonth)
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    func changeMonth(month: String) {
        self.currentMonth = month
        haruHappicPhotoController.setMonthData(month: month)
        haruHappicTagController.setMonthData(month: month)
        getHaruHappicPhoto(year: 2022, month: Int(currentMonth)!)
    }
}

// MARK: - Network
extension HaruHappicController {
    func checkPostStatus() {
        LoadingIndicator.showLoading()
        CreateContentsService.shared.getPostStatus { response in
            switch response {
            case .success(let result):
                guard let data = result as? PostStatusModel else { return }
                if data.isPosted {
                    self.showToast(message: "이미 오늘의 해픽을 등록했어요")
                } else {
                    self.setActionSheet()
                }
                LoadingIndicator.hideLoading()
            default:
                self.showAlert(title: "네트워크 오류로 인해\n데이터를 불러올 수 없습니다.\n다시 시도해 주세요.")
            }
        }
    }
}

extension HaruHappicController {
    func getHaruHappicPhoto(year: Int, month: Int) {
        LoadingIndicator.showLoading()
        HaruHappicService.shared.getHaruHappic(year: year, month: month) { response in
            switch response {
            case .success(let result):
                guard let data = result as? [HaruHappicModel] else { return }
                self.models = data
                if data.isEmpty {
                    self.haruHappicPhotoController.setEmptyImageView(bool: true)
                    self.haruHappicTagController.setEmptyImageView(bool: true)
                } else {
                    self.haruHappicPhotoController.setEmptyImageView(bool: false)
                    self.haruHappicTagController.setEmptyImageView(bool: false)
                    self.haruHappicPhotoController.setData(models: self.models)
                    self.haruHappicTagController.setData(models: self.models)
                }
            default:
                break
            }
        }
        LoadingIndicator.hideLoading()
    }
}
