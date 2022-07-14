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
    private let contentView = UIView()

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
