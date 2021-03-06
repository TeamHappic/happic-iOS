//
//  HomeController.swift
//  Happic-iOS
//
//  Created by sejin on 2022/07/08.
//

import UIKit

final class HomeController: BaseUploadViewController {
    
    // MARK: - Properties
    let userManager = UserManager.shared
    
    // MARK: - UI
    private lazy var levelLabel = UILabel().then {
        $0.text = "Lv1. 응애입니다."
        $0.textColor = .hpWhite
        $0.font = UIFont.font(.gmarketSansBold, ofSize: 18)
    }
    
    private lazy var progressLabel = UILabel().then {
        $0.text = "1/6"
        $0.textColor = .hpWhite
        $0.font = UIFont.font(.pretendardBold, ofSize: 16)
    }
    
    private lazy var levelProgressView = UIProgressView(
        progressViewStyle: .default).then {
            $0.progressTintColor = .hpDarkBlue
            $0.trackTintColor = .hpGray5
            $0.progress = 1/6
    }
    
    private lazy var characterImageView = UIImageView().then {
        $0.image = ImageLiterals.imageMoonLv1
        $0.contentMode = .scaleToFill
    }
    
    private lazy var nameLabel = UILabel().then {
        $0.text = "캐릭터 이름"
        $0.textColor = .hpWhite
        $0.font = UIFont.font(.pretendardBold, ofSize: 18)
    }
    
    private lazy var containerView = UIView().then {
        $0.backgroundColor = .hpBgBlack2
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
    }
    
    private lazy var conversationLabel = UILabel().then {
        $0.text = "아니 왜 밥 안줌\n너 오늘 뭐했는데\n바빴다고? 그럼 어쩔 수 없지."
        $0.textColor = .hpGray2
        $0.font = UIFont.font(.pretendardMedium, ofSize: 16)
        $0.addLabelSpacing(kernValue: 0, lineSpacing: 5)
        $0.textAlignment = .center
        $0.numberOfLines = 0
    }
    
    private lazy var actionButton = UIButton(type: .system).then {
        $0.setAttributedTitle(NSAttributedString(string: "하루 해픽 등록하기", attributes: [.font: UIFont.font(.pretendardBold, ofSize: 16), .foregroundColor: UIColor.hpGray9]), for: .normal)
        $0.setImage(ImageLiterals.icnRight, for: .normal)
        $0.semanticContentAttribute = .forceRightToLeft
        $0.backgroundColor = .hpOrange
        $0.layer.cornerRadius = 8
        $0.tintColor = .hpGray9
        $0.addTarget(self, action: #selector(handleActionButtonDidTap(sender:)), for: .touchUpInside)
    }
    
    private lazy var stackView = UIStackView(arrangedSubviews: [conversationLabel, actionButton]).then {
        $0.axis = .vertical
        $0.distribution = .fill
        $0.spacing = 24
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLogin()
        homeViewLoad()
        setPurpleBackgroundColor()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        homeViewLoad()
    }

    // MARK: - Functions
    private func configureUI() {
        view.addSubviews(levelLabel, progressLabel, levelProgressView, characterImageView, nameLabel, containerView)
        
        levelLabel.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(48)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(50)
        }
        
        progressLabel.snp.makeConstraints { make in
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(48)
            make.centerY.equalTo(levelLabel)
        }
        
        levelProgressView.snp.makeConstraints { make in
            make.top.equalTo(levelLabel.snp.bottom).offset(16)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(48)
        }
        
        characterImageView.snp.makeConstraints { make in
            make.top.equalTo(levelProgressView.snp.bottom).offset(100)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.width.height.equalTo(124)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(characterImageView.snp.bottom).offset(20)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
        }
        
        containerView.snp.makeConstraints { make in
            make.height.equalTo(184)
            make.centerY.equalTo(view.safeAreaLayoutGuide).multipliedBy(1.5)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
        }

        containerView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(24)
        }

        actionButton.snp.makeConstraints { make in
            make.height.equalTo(44)
        }
    }
    
    @objc private func handleActionButtonDidTap(sender: UIButton) {
//        checkPostStatus()
        setActionSheet()
    }
    
    func checkLogin() {
        if !userManager.hasJwtToken {
            let nextSB = UIStoryboard(name: "AuthView", bundle: nil)
            let nextVC = nextSB.instantiateViewController(withIdentifier: "AuthViewController")
            let nav = UINavigationController(rootViewController: nextVC)
            nav.modalPresentationStyle = .fullScreen
            self.present(nav, animated: false)
        }
    }
}

// MARK: - Network
extension HomeController {
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

extension HomeController {
    func homeViewLoad() {
        LoadingIndicator.showLoading()
        HomeService.shared.homeViewLoad { response in
            switch response {
            case .success(let result):
                guard let data = result as? HomeModel else { return }
                self.levelLabel.text = "Lv\(data.level). \(data.characterName)입니다."
                if data.characterId == 0 {
                    switch data.level {
                    case 1:
                        self.characterImageView.image = ImageLiterals.imageMoonLv1
                    case 2:
                        self.characterImageView.image = ImageLiterals.imageMoonLv2
                    case 3:
                        self.characterImageView.image = ImageLiterals.imageMoonLv3
                    case 4:
                        self.characterImageView.image = ImageLiterals.imageMoonLv4
                    default:
                        break
                    }
                } else {
                    switch data.level {
                    case 1:
                        self.characterImageView.image = ImageLiterals.imageCloudLv1
                    case 2:
                        self.characterImageView.image = ImageLiterals.imageCloudLv2
                    case 3:
                        self.characterImageView.image = ImageLiterals.imageCloudLv3
                    case 4:
                        self.characterImageView.image = ImageLiterals.imageCloudLv4
                    default:
                        break
                    }
                }
                
                if data.isPosted == true {
                    self.actionButton.isHidden = true
                } else {
                    self.actionButton.isHidden = false
                }
                self.progressLabel.text = "\(data.growthRate)/6"
                self.nameLabel.text = data.characterName
                let progressValue: Float = Float(data.growthRate) / 6
                self.levelProgressView.setProgress(progressValue, animated: true)
                
                LoadingIndicator.hideLoading()
            default:
                self.showAlert(title: "네트워크 오류로 인해\n데이터를 불러올 수 없습니다.\n다시 시도해 주세요.")
            }
        }
    }
}
