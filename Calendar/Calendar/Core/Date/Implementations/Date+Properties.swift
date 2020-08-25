//
//  Date+Properties.swift
//  Calendar
//
//  Created by Manish on 25/08/20.
//  Copyright © 2020 Manish. All rights reserved.
//

import Foundation

extension Date: DatePropertyProvider {
    
    public var dayShortName: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EE"
        
        return dateFormatter.string(from: self)
    }
    
    public var nextMonth: Date {
        return Calendar.current.date(byAdding: .month, value: 1, to: self)!
    }
    
    public var prevMonth: Date {
        return Calendar.current.date(byAdding: .month, value: -1, to: self)!
    }
    
    public var isCurrentMonth: Bool {
        let currentMonthYear = Calendar.current.dateComponents([.month, .year], from: Date())
        let dateMonthYear = Calendar.current.dateComponents([.month, .year], from: self)
        
        return currentMonthYear.month == dateMonthYear.month && currentMonthYear.year == dateMonthYear.year
    }
    
    public var isCurrentYear: Bool {
        let currentMonthYear = Calendar.current.dateComponents([.year], from: Date())
        let dateMonthYear = Calendar.current.dateComponents([.year], from: self)
        
        return currentMonthYear.year == dateMonthYear.year
    }
    
    public var isToday: Bool {
        return Calendar.current.isDateInToday(self)
    }
    
    public var day: Int {
        return Calendar.current.dateComponents([.day], from: self).day!
    }
    
    public var monthName: String {
        let monthIndex = Calendar.current.dateComponents([.month], from: self).month!
        let dateFormatter = DateFormatter()
        
        return dateFormatter.monthSymbols[monthIndex - 1]
    }
    
    public var monthShortName: String {
        let monthIndex = Calendar.current.dateComponents([.month], from: self).month!
        let dateFormatter = DateFormatter()
        
        return dateFormatter.shortMonthSymbols[monthIndex - 1]
    }
    
    public var year: Int {
        return Calendar.current.dateComponents([.year], from: self).year!
    }

    public var readableDate: String {
        
        if self.isToday {
            return "Today"
        }
        
        if self.isCurrentYear {
            return "\(self.day) \(self.monthShortName)"
        }
        
        return "\(self.day)-\(self.monthShortName)-\(self.year)"
    }
    
}
