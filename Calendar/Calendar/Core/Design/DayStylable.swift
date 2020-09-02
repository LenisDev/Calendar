//
//  DayStylable.swift
//  Calendar
//
//  Created by Manish on 02/09/20.
//  Copyright © 2020 Manish. All rights reserved.
//

import Foundation

/// Style applied on days of calendar month
public protocol DayStylable {
    /// Today's date
    var today: Stylable? { get set }

    /// Selected date
    var selected: Stylable? { get set }

    /// Unselected days
    var unselected: Stylable? { get set }
}
