//
//  CalendarDateProvider.swift
//  Calendar
//
//  Created by Manish on 25/08/20.
//  Copyright © 2020 Manish. All rights reserved.
//

import Foundation

public protocol CalendarDateProvider {
    
    /// Generates month dates based on date provided as parameter value
    /// - Parameter date: date to be used for generating month dates
    ///
    /// - Important: Returns empty array when given date is not valid
    ///
    func generateDatesForMonth(from date: Date) -> [Date]
    
}
