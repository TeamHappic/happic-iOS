//
//  CreateContentsController.swift
//  Happic-iOS
//
//  Created by devxsby on 2022/07/14.
//

import UIKit

final class CreateContentsController: UIViewController {
    
    // MARK: - UI
    private let scrollView = UIScrollView()
    private let headerView = UIView()
    private let containerView = UIView()
    
    private lazy var backButton = UIButton(type: .system).then {
        $0.setImage(ImageLiteral.icnArrowBack, for: .normal)
        $0.tintColor = .hpWhite
        $0.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
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
    
    private let pickerImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.layer.masksToBounds = true
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
        setScrollView()
    }
    
    private func setScrollView() {
        view.addSubview(scrollView)
        
        view.backgroundColor = .yellow
        scrollView.backgroundColor = .purple
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView.contentLayoutGuide)
            make.width.equalTo(scrollView.snp.width)
            make.height.greaterThanOrEqualTo(scrollView.snp.height).priority(500)
        }
    }
}
