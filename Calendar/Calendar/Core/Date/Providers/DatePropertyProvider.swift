//
//  DatePropertyProvider.swift
//  Calendar
//
//  Created by Manish on 25/08/20.
//  Copyright © 2020 Manish. All rights reserved.
//

import Foundation

public protocol DatePropertyProvider {
    
    /// Returns 3 letter (short name) for given date
    ///
    /// - Example usage
    /// ~~~
    /// date.dayShortName
    /// ~~~
    /// will return Sat (date = 25 July 2020)
    ///
    var dayShortName: String { get }
    
    var nextMonth: Date { get }
    
    var prevMonth: Date { get }
    
    var isCurrentMonth: Bool { get }
    
    var isCurrentYear: Bool { get }
    
    var isToday: Bool { get }
    
    var day: Int { get }
    
    var monthName: String { get }
    
    var monthShortName: String { get }
    
    var year: Int { get }
    
    var readableDate: String { get }
    
}
