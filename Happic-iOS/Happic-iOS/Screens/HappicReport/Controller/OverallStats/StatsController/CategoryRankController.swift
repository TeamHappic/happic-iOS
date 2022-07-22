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
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setBlueBackGroundColor()
        configureUI()
    }
    
    // MARK: - Functions
    private func configureUI() {
        view.addSubviews(categoryRankView)
        categoryRankView.headerView.hideShowDetailRankViewButton()
        categoryRankView.collectionViewCanScroll(true)
        categoryRankView.snp.makeConstraints { make in
            make.top.bottom.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
    }
}

// MARK: - Network
extension CategoryRankController {
    func getCategoryRank(year: String = "2022", month: String) {
        HappicReportService.shared.getCategoryRank(option: "when", year: year, month: month) { response in
            switch response {
            case .success(let result):
                guard let data = result as? CategoryRankModel else { return }
                self.categoryRankView.setWhenData(model: data.ranks)
            default:
                break
            }
        }
        
        HappicReportService.shared.getCategoryRank(option: "where", year: year, month: month) { response in
            switch response {
            case .success(let result):
                guard let data = result as? CategoryRankModel else { return }
                self.categoryRankView.setWhereData(model: data.ranks)
            default:
                break
            }
        }
        
        HappicReportService.shared.getCategoryRank(option: "who", year: year, month: month) { response in
            switch response {
            case .success(let result):
                guard let data = result as? CategoryRankModel else { return }
                self.categoryRankView.setWhoData(model: data.ranks)
            default:
                break
            }
        }
        
        HappicReportService.shared.getCategoryRank(option: "what", year: year, month: month) { response in
            switch response {
            case .success(let result):
                guard let data = result as? CategoryRankModel else { return }
                self.categoryRankView.setWhatData(model: data.ranks)
            default:
                break
            }
        }
    }
}
