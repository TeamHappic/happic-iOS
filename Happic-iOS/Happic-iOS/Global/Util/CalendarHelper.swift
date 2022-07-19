//
//  CalendarHelper.swift
//  Happic-iOS
//
//  Created by sejin on 2022/07/13.
//

import Foundation

class CalendarHelper {
    
    static let shared = CalendarHelper()
    
    let calendar = Calendar.current
    
    /// monthGap에 새로 선택된 달과 현재 달의 차이값을 입력하면 새로 선택된 달 date를 리턴
    func changeMonth(date: Date, monthGap: Int) -> Date {
        return calendar.date(byAdding: .month, value: monthGap, to: date)!
    }
    
    /// e.g.) 15 Jan 2022 -> 15 Feb 2022
    func plusMonth(date: Date) -> Date {
        return calendar.date(byAdding: .month, value: 1, to: date)!
    }
    
    /// e.g.) 15 Jan 2022 -> 15 Dec 2021
    func minusMonth(date: Date) -> Date {
        return calendar.date(byAdding: .month, value: -1, to: date)!
    }
    
    /// e.g.) 15 Jan 2022 -> January
    func monthString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL"
        return dateFormatter.string(from: date)
    }
    
    /// e.g.) 15 Jan 2022 -> 2022
    func yearString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter.string(from: date)
    }
    
    /// e.g.) 15 Jan 2022 -> 31
    func daysInMonth(date: Date) -> Int {
        let range = calendar.range(of: .day, in: .month, for: date)!
        return range.count
    }
    
    /// e.g.) 2 Jan 2022 -> 2
    func dayOfMonth(date: Date) -> Int {
        let components = calendar.dateComponents([.day], from: date)
        return components.day!
    }
    
    /// e.g.) 15 Jan 2022 -> 1 Jan 2022
    func firstOfMonth(date: Date) -> Date {
        let components = calendar.dateComponents([.year, .month], from: date)
        return calendar.date(from: components)!
    }
    
    /// e.g.) 1 Jan 2022 -> 6 (saturday)
    func weekDay(date: Date) -> Int {
        let components = calendar.dateComponents([.weekday], from: date)
        return components.weekday! - 1
    }
}
