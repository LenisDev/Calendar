//
//  DayViewModel.swift
//  Calendar
//
//  Created by Manish on 25/08/20.
//  Copyright © 2020 Manish. All rights reserved.
//

import Foundation

/// Date selection state
public enum DayState: Int {
    case selected = 0
    case unSelected
}

/// Data view model for each day view
public struct DayViewModel: BaseViewModel {
    public var id: String

    let date: Date
    var state: DayState = .unSelected
}
