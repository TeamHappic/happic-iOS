//
//  HappicCapsuleController.swift
//  Happic-iOS
//
//  Created by sejin on 2022/07/08.
//

import UIKit
import Kingfisher

final class HappicCapsuleController: BaseUploadViewController {
    
    // MARK: - UI
    private lazy var cancelButton = UIButton(type: .system).then {
        $0.setImage(ImageLiterals.icnCancel, for: .normal)
        $0.tintColor = .hpGray6
        $0.addTarget(self, action: #selector(handleCancelButtonDidTap(sender:)), for: .touchUpInside)
    }
    
    private lazy var titleLabel = UILabel().then {
        $0.text = "해픽 캡슐"
        $0.textColor = .hpGray3
        $0.font = UIFont.font(.gmarketSansBold, ofSize: 20)
    }
    
    private lazy var descriptionLabel = UILabel().then {
        $0.text = "너가 기록한 행복의 순간 중 하나를 보여줄게!"
        $0.textColor = .hpGray3
        $0.font = UIFont.font(.pretendardMedium, ofSize: 12)
    }
    
    private lazy var capsuleImageView = UIImageView().then {
        $0.image = ImageLiterals.imageCapsuleMachine
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = false
    }
    
    private lazy var drawCapsuleButton = UIButton(type: .system).then {
        $0.setAttributedTitle(NSAttributedString(string: "해픽 캡슐 뽑기",
                                                 attributes: [.font: UIFont.font(.pretendardBold, ofSize: 16)]),
                                                for: .normal)
        $0.setImage(ImageLiterals.icnRight, for: .normal)
        $0.tintColor = .hpGray9
        $0.setTitleColor(.hpGray9, for: .normal)
        $0.backgroundColor = .hpOrange
        $0.semanticContentAttribute = .forceRightToLeft
        $0.layer.cornerRadius = 8
        $0.addTarget(self, action: #selector(handleDrawButtonDidTap(sender:)), for: .touchUpInside)
    }
    
    private lazy var capsuleView = HappicCapsuleView()
    
    private lazy var createContentsButton = UIButton(type: .system).then {
        $0.setAttributedTitle(NSAttributedString(string: "오늘의 행복도 기록하기",
                                                 attributes: [.font: UIFont.font(.pretendardBold, ofSize: 16)]),
                                                for: .normal)
        $0.setImage(ImageLiterals.icnRight, for: .normal)
        $0.tintColor = .hpOrange
        $0.setTitleColor(.hpOrange, for: .normal)
        $0.backgroundColor = .hpBgBlack1
        $0.semanticContentAttribute = .forceRightToLeft
        $0.layer.cornerRadius = 8
        $0.addTarget(self, action: #selector(handleCreateContentsButtonDidTap(sender:)), for: .touchUpInside)
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: - Functions
    private func configureUI() {
        view.backgroundColor = .hpBgBlack2
        view.addSubviews(cancelButton, titleLabel, descriptionLabel, capsuleImageView, drawCapsuleButton)
        
        cancelButton.snp.makeConstraints { make in
            make.top.trailing.equalTo(view.safeAreaLayoutGuide).inset(5)
            make.width.height.equalTo(48)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(cancelButton.snp.bottom).offset(3)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(titleLabel.snp.bottom).offset(12)
        }
        
        capsuleImageView.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(descriptionLabel.snp.bottom).offset(54)
            make.width.equalTo(220.adjusted)
            make.height.equalTo(364.adjustedH)
        }
        
        drawCapsuleButton.snp.makeConstraints { make in
            make.top.greaterThanOrEqualTo(capsuleImageView.snp.bottom).offset(10)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(44)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(57)
            make.height.equalTo(44)
        }
    }
    
    @objc func handleCancelButtonDidTap(sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @objc func handleDrawButtonDidTap(sender: UIButton) {
        getHappicCapsule()
        canPost()
        
        capsuleImageView.isHidden = true
        drawCapsuleButton.isHidden = true
        
        titleLabel.text = "해픽 캡슐 개봉"
        descriptionLabel.text = "해픽의 별이 된, 너의 행복한 순간이야"
        
        view.addSubviews(capsuleView, createContentsButton)
        capsuleView.snp.makeConstraints { make in
            make.top.greaterThanOrEqualTo(descriptionLabel.snp.bottom).offset(30)
            make.top.lessThanOrEqualTo(descriptionLabel.snp.bottom).offset(54)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(42)
        }
        
        createContentsButton.snp.makeConstraints { make in
            make.top.greaterThanOrEqualTo(capsuleView.snp.bottom).offset(10)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(44)
            make.height.equalTo(44)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(57)
        }
    }
    
    @objc func handleCreateContentsButtonDidTap(sender: UIButton) {
        setActionSheet()
    }
}

// MARK: - Network
extension HappicCapsuleController {
    func getHappicCapsule() {
        LoadingIndicator.showLoading()
        HomeService.shared.getHappicCapsule { response in
            switch response {
            case .success(let result):
                guard let data = result as? HappicCapsuleModel else { return }
                self.capsuleView.dateLabel.text = data.date.serverTimeToString(forUse: .forDefault)
                self.capsuleView.happicImageView.setImage(with: data.photo)
                self.capsuleView.whenLabel.text = "#" + "\(data.when)".timeFormatted
                self.capsuleView.whoLabel.text = "#\(data.who)"
                self.capsuleView.whatLabel.text = "#\(data.what)"
                self.capsuleView.whereLabel.text = "#\(data.place)"
            default:
                break
            }
        }
        LoadingIndicator.hideLoading()
    }
    
    func canPost() {
        LoadingIndicator.showLoading()
        CreateContentsService.shared.getPostStatus { response in
            switch response {
            case .success(let result):
                guard let data = result as? PostStatusModel else { return }
                self.createContentsButton.isHidden = data.isPosted
            default:
                break
            }
        }
        LoadingIndicator.hideLoading()
    }
}
