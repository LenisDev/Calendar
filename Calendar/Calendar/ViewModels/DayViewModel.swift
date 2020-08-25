//
//  DayViewModel.swift
//  Calendar
//
//  Created by Manish on 25/08/20.
//  Copyright © 2020 Manish. All rights reserved.
//

import Foundation

public enum DayState: Int {
    case selected = 0
    case unSelected
}

struct DayViewModel: BaseViewModel {
    var id: String

    let date: Date
    var state: DayState = .unSelected
}
