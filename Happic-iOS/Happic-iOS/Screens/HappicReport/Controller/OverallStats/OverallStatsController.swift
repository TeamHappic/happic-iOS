//
//  OverallStatsController.swift
//  Happic-iOS
//
//  Created by sejin on 2022/07/13.
//

import UIKit
import Tabman
import Pageboy

final class OverallStatsController: UIViewController {

    // MARK: - Properties
    private let viewPager = TabmanViewController()
    private let keywordRankViewController = KeywordRankController()
    private let categoryRankController = CategoryRankController()
    private let monthHappicRecordController = MonthHappicRecordController()

    private lazy var viewControllers = [keywordRankViewController, categoryRankController, monthHappicRecordController]
    
    private let buttonTitles = ["키워드 순위", "카테고리 별 순위", "월 기록 횟수"]
    
    var selectedIndex = 0
    
    // MARK: - UI
    private lazy var containerView = UIView()

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewPager()
    }

    override func viewWillAppear(_ animated: Bool) {
        scrollToIndex(indexOf: selectedIndex)
    }
    
    // MARK: - Functions
    private func setViewPager() {
        setViewPagerLayout()
        setViewPagerBar()
        viewPager.dataSource = self
    }
    
    private func setViewPagerBar() {
        let bar = TMBarView<TMHorizontalBarLayout, CustomTabPagerButton, TMBarIndicator.None>()
        bar.layout.transitionStyle = .snap
        bar.layout.alignment = .centerDistributed
        bar.layout.contentMode = .fit
        bar.layout.interButtonSpacing = 0
        bar.buttons.customize { button in
            button.font = UIFont.font(.pretendardMedium, ofSize: 12)
            button.backgroundColor = UIColor.hpGray9
            button.tintColor = .lightGray
            button.selectedTintColor = .orange
            button.heightAnchor.constraint(equalToConstant: 44).isActive = true
        }
        bar.indicator.isHidden = true
        viewPager.addBar(bar, dataSource: self, at: .top)
        viewPager.isScrollEnabled = false
    }

    private func setViewPagerLayout() {
        view.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }

        viewPager.view.frame = containerView.frame
        containerView.addSubview(viewPager.view)
    }
    
    func scrollToIndex(indexOf: Int) {
        viewPager.scrollToPage(.at(index: indexOf), animated: false)
    }
}

// MARK: - Extensions
extension OverallStatsController: PageboyViewControllerDataSource, TMBarDataSource {
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }

    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }

    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }

    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        let item = TMBarItem(title: buttonTitles[index])
        return item
    }
}
