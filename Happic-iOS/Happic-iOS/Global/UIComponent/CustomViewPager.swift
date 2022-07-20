//
//  CustomViewPager.swift
//  Happic-iOS
//
//  Created by sejin on 2022/07/08.
//

import UIKit
import Tabman
import Pageboy
import SnapKit

final class CustomViewPager: UIView {
    // MARK: - Properties
    var viewControllers: [UIViewController]
    var buttonTitles: [String]
    
    // MARK: - UI
    private let tabMan = TabmanViewController()
    
    // MARK: - Initialization
    init(viewControllers: [UIViewController],
         buttonTitles: [String],
         buttonTintColor: UIColor = .white,
         buttonFontSize: Int = 14,
         barHeight: Int = 40,
         indicatorWeight: Int = 1,
         isScrollEnabled: Bool
    ) {
        self.viewControllers = viewControllers
        self.buttonTitles = buttonTitles
        super.init(frame: .zero)
        configureUI()
        setViewPager(barHeight: barHeight, buttonTintColor: buttonTintColor, buttonFontSize: buttonFontSize, indicatorWeight: indicatorWeight, isScrollEnabled: isScrollEnabled)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    private func configureUI() {
        tabMan.view.frame = self.frame
        addSubview(tabMan.view)
        tabMan.dataSource = self
    }
    
    private func setViewPager(barHeight: Int, buttonTintColor: UIColor, buttonFontSize: Int, indicatorWeight: Int, isScrollEnabled: Bool) {
        // Create bar
        let bar = TMBar.ButtonBar()
        let systemBar = bar.systemBar()
        systemBar.bar.backgroundColor = UIColor.clear
        bar.backgroundColor = UIColor.clear
        bar.layout.transitionStyle = .snap
        bar.layout.alignment = .centerDistributed
        bar.layout.contentMode = .fit
        bar.layout.interButtonSpacing = 0
        bar.buttons.customize { button in
            button.backgroundColor = UIColor.clear
            button.tintColor = buttonTintColor
            button.selectedTintColor = .orange
            button.font = UIFont.font(.pretendardBold, ofSize: 14)
            button.heightAnchor.constraint(equalToConstant: CGFloat(barHeight)).isActive = true
        }
        
        bar.indicator.tintColor = .orange
        bar.indicator.weight = .custom(value: CGFloat(indicatorWeight))
        
        // Add to view
        tabMan.addBar(bar, dataSource: self, at: .top)
        tabMan.isScrollEnabled = isScrollEnabled
        
        // unselected 상태의 인디케이터 바 추가
        let indicatorView = UIView().then {
            $0.backgroundColor = .hpGray6
        }
        addSubview(indicatorView)
        sendSubviewToBack(indicatorView)
        indicatorView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(indicatorWeight)
            make.top.equalTo(bar.snp.bottom).inset(indicatorWeight)
        }
    }
    
    func scrollToIndex(indexOf: Int) {
        tabMan.scrollToPage(.at(index: indexOf), animated: false)
    }
}

extension CustomViewPager: PageboyViewControllerDataSource, TMBarDataSource {
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
