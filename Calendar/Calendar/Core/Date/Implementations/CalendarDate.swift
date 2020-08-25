//
//  CalendarDate.swift
//  Calendar
//
//  Created by Manish on 25/08/20.
//  Copyright © 2020 Manish. All rights reserved.
//

import Foundation

public struct CalendarDate {
    
    // Initial Properties
    var calendar: Calendar
    
    public init(customCalendar: Calendar = Calendar.current,
                timeZone: TimeZone = TimeZone.current,
                local: Locale = Locale.current) {
        
        self.calendar = customCalendar
        self.calendar.timeZone = timeZone
        self.calendar.locale = local
    }
}

// MARK: - Implimentation
extension CalendarDate: CalendarDateProvider {
    
    public func generateDatesForMonth(from date: Date) -> [Date] {
        
        if let totalDaysInMonth = calendar.range(of: .day, in: .month, for: date)?.count {
            
            var dates = [Date]()
            var dateComponents = calendar.dateComponents([.day, .month, .year], from: date)
            
            for day in 1...totalDaysInMonth {
                dateComponents.day = day
                dateComponents.hour = 12
                
                dates.append(calendar.date(from: dateComponents)!)
            }
            
            return dates
        } else {
            return []
        }
        
    }
    
}
