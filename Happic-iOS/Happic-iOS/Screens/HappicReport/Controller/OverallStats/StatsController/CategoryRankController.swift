//
//  CategoryRankController.swift
//  Happic-iOS
//
//  Created by sejin on 2022/07/13.
//

import UIKit

final class CategoryRankController: UIViewController {
    
    // MARK: - UI
    private lazy var categoryRankView = CategoryRankView()
    
    private lazy var logoImageView = UIImageView().then {
        $0.image = ImageLiterals.imageEmpty
        $0.contentMode = .scaleAspectFill
    }
    
    private lazy var contentLabel = UILabel().then {
        $0.text = "수집된 키워드가 부족해요"
        $0.textColor = .hpGray7
        $0.font = UIFont.font(.pretendardMedium, ofSize: 16)
    }
    
    private lazy var containerView = UIView().then {
        $0.backgroundColor = .clear
        $0.addSubviews(logoImageView, contentLabel)
        
        logoImageView.snp.makeConstraints { make in
            make.width.height.equalTo(192)
            make.leading.top.trailing.equalToSuperview()
        }
        
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
        }
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setBlueBackGroundColor()
        configureUI()
    }
    
    // MARK: - Functions
    private func configureUI() {
        view.addSubviews(categoryRankView, containerView)
        categoryRankView.headerView.hideShowDetailRankViewButton()
        categoryRankView.collectionViewCanScroll(true)
        categoryRankView.snp.makeConstraints { make in
            make.top.bottom.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        containerView.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(143)
        }        
    }
    
    func handleEmptyView(isEmpty: Bool) {
        categoryRankView.isHidden = isEmpty
        containerView.isHidden = !isEmpty
    }
}

// MARK: - Network
extension CategoryRankController {
    func getCategoryRank(year: String = "2022", month: String) {
        LoadingIndicator.showLoading()
        HappicReportService.shared.getCategoryRank(option: "when", year: year, month: month) { response in
            switch response {
            case .success(let result):
                guard let data = result as? [KeywordModel] else { return }
                self.handleEmptyView(isEmpty: data.isEmpty)
                self.categoryRankView.setWhenData(model: data)
            default:
                break
            }
        }
        
        HappicReportService.shared.getCategoryRank(option: "where", year: year, month: month) { response in
            switch response {
            case .success(let result):
                guard let data = result as? [KeywordModel] else { return }
                self.categoryRankView.setWhereData(model: data)
            default:
                break
            }
        }
        
        HappicReportService.shared.getCategoryRank(option: "who", year: year, month: month) { response in
            switch response {
            case .success(let result):
                guard let data = result as? [KeywordModel] else { return }
                self.categoryRankView.setWhoData(model: data)
            default:
                break
            }
        }
        
        HappicReportService.shared.getCategoryRank(option: "what", year: year, month: month) { response in
            switch response {
            case .success(let result):
                guard let data = result as? [KeywordModel] else { return }
                self.categoryRankView.setWhatData(model: data)
            default:
                break
            }
        }
        LoadingIndicator.hideLoading()
    }
}
