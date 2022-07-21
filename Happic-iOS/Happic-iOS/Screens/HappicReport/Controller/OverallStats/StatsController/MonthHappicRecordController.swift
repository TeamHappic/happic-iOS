//
//  MonthHappicRecordController.swift
//  Happic-iOS
//
//  Created by sejin on 2022/07/13.
//

import UIKit

final class MonthHappicRecordController: UIViewController {
    
    // MARK: - UI
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let monthHappicRecordView = MonthHappicRecordView()
    private let headerView = HappicReportSectionHeader(type: .monthCalendar)
    private let calendarView = CustomCalendarView()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setBlueBackGroundColor()
        configureUI()
        getMonthlyData(month: "7")
    }
    
    // MARK: - Functions
    private func configureUI() {
        setScrollView()
        setSubViews()
    }
    
    private func setScrollView() {
        view.addSubview(scrollView)
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
    
    private func setSubViews() {
        contentView.addSubviews(monthHappicRecordView, headerView, calendarView)
        monthHappicRecordView.headerView.hideShowDetailRankViewButton()
        monthHappicRecordView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(295)
        }

        headerView.hideShowDetailRankViewButton()
        headerView.snp.makeConstraints { make in
            make.top.equalTo(monthHappicRecordView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
        }

        calendarView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom)
            make.trailing.leading.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(100)
        }
    }
    
    func changeCalendarMonth(monthGap: Int) {
        calendarView.changeMonth(monthGap: monthGap)
    }
}

// MARK: - Network
extension MonthHappicRecordController {
    func getMonthlyData(year: String = "2022", month: String) {
        HappicReportService.shared.getMonthlyCount(year: year, month: month) { response in
            switch response {
            case .success(let result):
                guard let data = result as? MonthlyCountModel else { return }
                self.monthHappicRecordView.setData(model: data)
                self.calendarView.setData(model: data)
            default:
                break
            }
        }
    }
}
