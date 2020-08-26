//
//  String+Date.swift
//  Calendar
//
//  Created by Manish on 25/08/20.
//  Copyright © 2020 Manish. All rights reserved.
//

import Foundation

extension String {

    /// Converts string to date with given date format
    /// - Parameter format: date format
    /// - Returns: Self
    func toDate(_ format: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = format
        
        return dateFormatter.date(from: self)!
    }
    
}
