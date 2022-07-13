//
//  CustomCalendarView.swift
//  Happic-iOS
//
//  Created by sejin on 2022/07/13.
//

import UIKit

class CustomCalendarView: UIView {

    // MARK: - Properties
    var selectedDate = Date()
    var totalSquares = [String]()

    // MARK: - UI
    private lazy var sundayLabel = UILabel().then {
        $0.text = "일"
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    private lazy var mondayLabel = UILabel().then {
        $0.text = "월"
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    private lazy var tuesdayLabel = UILabel().then {
        $0.text = "화"
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    private lazy var wednesdayLabel = UILabel().then {
        $0.text = "수"
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    private lazy var thursdayLabel = UILabel().then {
        $0.text = "목"
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    private lazy var fridayLabel = UILabel().then {
        $0.text = "금"
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    private lazy var saturdayLabel = UILabel().then {
        $0.text = "토"
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    private lazy var dayOfWeekStackView = UIStackView(arrangedSubviews: [sundayLabel, mondayLabel, tuesdayLabel, wednesdayLabel, thursdayLabel, fridayLabel, saturdayLabel]).then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
    }
    
    private let calendarCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .blue
        collectionView.isScrollEnabled = false
        return collectionView
    }()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        setMonthView()
        setCollectionView()
        setDelegate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    private func configureUI() {
        backgroundColor = .darkGray
        layer.cornerRadius = 20
        
        addSubview(dayOfWeekStackView)
        dayOfWeekStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(16)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(24)
        }
        
        addSubview(calendarCollectionView)
        let collectionViewWidth = UIScreen.main.bounds.width - 20
        let cellWidth: Float = Float(collectionViewWidth / 7)
        let cellHeight: Float = cellWidth * (32/40)
        let collectionViewHeight = cellHeight * 6 - 14 // 6줄, 총 줄 간격 14
        calendarCollectionView.snp.makeConstraints { make in
            make.top.equalTo(dayOfWeekStackView.snp.bottom).offset(10)
            make.trailing.leading.equalToSuperview()
            make.bottom.equalToSuperview().inset(16)
            make.height.equalTo(collectionViewHeight)
        }
    }
    
    private func setCollectionView() {
        calendarCollectionView.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: CalendarCollectionViewCell.className)
    }
    
    private func setDelegate() {
        calendarCollectionView.delegate = self
        calendarCollectionView.dataSource = self
    }
    
    func setMonthView() {
        totalSquares.removeAll()
        
        let daysInMonth = CalendarHelper.shared.daysInMonth(date: selectedDate)
        let firstDayOfMonth = CalendarHelper.shared.firstOfMonth(date: selectedDate)
        let startingSpaces = CalendarHelper().weekDay(date: firstDayOfMonth)
        
        var count: Int = 1
        
        while count <= 42 {
            if count <= startingSpaces || count - startingSpaces > daysInMonth {
                totalSquares.append("")
            } else {
                totalSquares.append(String(count - startingSpaces))
            }
            count += 1
        }
        
        calendarCollectionView.reloadData()
    }
}

// MARK: - Extensions

extension CustomCalendarView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return totalSquares.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CalendarCollectionViewCell.className, for: indexPath) as? CalendarCollectionViewCell else { return UICollectionViewCell() }
        
        cell.dayLabel.text = totalSquares[indexPath.item]
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        return cell
    }
}

extension CustomCalendarView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.size.width) / 7
        let height =  width * (32/40)
        return CGSize(width: width, height: height)
    }
}
