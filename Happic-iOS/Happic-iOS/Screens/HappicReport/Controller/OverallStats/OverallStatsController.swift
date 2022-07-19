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
    private var selectedMonth = Calendar.current.component(.month, from: Date())
    
    private let viewPager = TabmanViewController()
    private let keywordRankViewController = KeywordRankController()
    private let categoryRankController = CategoryRankController()
    private let monthHappicRecordController = MonthHappicRecordController()
    private lazy var viewControllers = [keywordRankViewController, categoryRankController, monthHappicRecordController]
    private let buttonTitles = ["키워드 순위", "카테고리 별 순위", "월 기록 횟수"]
    var selectedIndex = 0
    
    // MARK: - UI
    private lazy var backButton = UIButton(type: .system).then {
        $0.setImage(ImageLiterals.icnLeft, for: .normal)
        $0.tintColor = .hpWhite
        $0.addTarget(self, action: #selector(handleBackButtonDidTap), for: .touchUpInside)
    }
    
    private let customMonthView = CustomMonthView()
    private let customMonthPickerView = CustomMonthPickerView()
    private lazy var containerView = UIView()

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setPurpleBackgroundColor()
        configureUI()
        setDelegate()
        setViewPager()
    }

    override func viewWillAppear(_ animated: Bool) {
        scrollToIndex(indexOf: selectedIndex)
    }
        
    // MARK: - Functions
    private func configureUI() {
        view.addSubviews(customMonthView, backButton, customMonthPickerView, containerView)
        customMonthView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(65)
        }
        
        backButton.snp.makeConstraints { make in
            make.leading.equalTo(customMonthView)
            make.centerY.equalTo(customMonthView)
            make.width.height.equalTo(48)
        }
        
        customMonthPickerView.snp.makeConstraints { make in
            make.top.equalTo(customMonthView.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(230)
        }
        
        customMonthPickerView.isHidden = true
    }
    
    private func setDelegate() {
        customMonthView.delegate = self
        customMonthPickerView.delegate = self
    }
    
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
        containerView.snp.makeConstraints { make in
            make.top.equalTo(customMonthView.snp.bottom)
            make.leading.bottom.trailing.equalTo(view.safeAreaLayoutGuide)
        }

        viewPager.view.frame = containerView.frame
        containerView.addSubview(viewPager.view)
    }
    
    func scrollToIndex(indexOf: Int) {
        viewPager.scrollToPage(.at(index: indexOf), animated: false)
    }
    
    @objc func handleBackButtonDidTap() {
        navigationController?.popViewController(animated: true)
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

extension OverallStatsController: CustomMonthViewDelegate {
    func setMonthPickerView(_ isMonthViewEnabled: Bool) {
        if isMonthViewEnabled {
            self.view.bringSubviewToFront(customMonthPickerView)
            customMonthPickerView.isHidden = false
        } else {
            customMonthPickerView.isHidden = true
        }
    }
}

extension OverallStatsController: CustomMonthPickerViewDelegate {
    func changeMonthStatus(_ month: String) {
        let monthGap = Int(month)! - selectedMonth
        monthHappicRecordController.changeCalendarMonth(monthGap: monthGap)
        selectedMonth = Int(month)!
        
        if month.count == 1 {
            customMonthView.monthLabel.text = "2022 . 0\(month)"
        } else {
            customMonthView.monthLabel.text = "2022 . \(month)"
        }
    }
}
