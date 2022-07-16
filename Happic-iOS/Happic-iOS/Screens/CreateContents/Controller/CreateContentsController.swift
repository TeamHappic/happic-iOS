//
//  CreateContentsController.swift
//  Happic-iOS
//
//  Created by devxsby on 2022/07/14.
//

import UIKit

final class CreateContentsController: UIViewController {
    
    // MARK: - UI
    private lazy var headerView = UIView()
    private lazy var scrollView = UIScrollView()
    private lazy var containerView = UIView()
    
    private lazy var backButton = UIButton(type: .system).then {
        $0.setImage(ImageLiteral.icnArrowBack, for: .normal)
        $0.tintColor = .hpWhite
        $0.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        $0.addTarget(self, action: #selector(dismissViewController), for: .touchUpInside)
    }
    
    private let dateLabel = UILabel().then {
        $0.text = "06.26 해픽"
        $0.textColor = .hpWhite
        $0.font = UIFont.font(.pretendardBold, ofSize: 16)
    }
    
    private let saveButton = UIButton(type: .system).then {
        $0.setAttributedTitle(NSAttributedString(string: "저장", attributes: [.font: UIFont.font(.pretendardBold, ofSize: 16)]), for: .normal)
        $0.setTitleColor(.hpGray6, for: .normal)
    }
    
    var pickerImageView = UIImageView().then {
        $0.image = ImageLiteral.imageDailySample3
        $0.contentMode = .scaleAspectFill
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 12
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }
    
    // MARK: - Functions
    private func configureUI() {
        setHeaderView()
        setScrollView()
    }
    
    private func setHeaderView() {
        view.addSubview(headerView)
        headerView.addSubviews(backButton, dateLabel, saveButton)
        
        headerView.backgroundColor = .hpBgBlack2h
        
        headerView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(65)
        }
        
        backButton.snp.makeConstraints { make in
            make.centerY.equalTo(headerView)
            make.leading.equalTo(headerView.snp.leading).offset(20)
            make.width.height.equalTo(48)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.center.equalTo(headerView)
        }
        
        saveButton.snp.makeConstraints { make in
            make.centerY.equalTo(headerView)
            make.trailing.equalTo(headerView.snp.trailing).inset(20)
            make.width.height.equalTo(48)
        }
    }
    
    private func setScrollView() {
        
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubviews(pickerImageView)
        containerView.backgroundColor = .hpBgBlack1
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom)
            make.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        containerView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView.contentLayoutGuide)
            make.width.equalTo(scrollView.snp.width)
            make.height.greaterThanOrEqualTo(scrollView.snp.height).priority(500)
        }
        
        pickerImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(300.adjusted)
        }
    }
    
    @objc private func dismissViewController() {
        self.dismiss(animated: true, completion: nil)
    }
}
