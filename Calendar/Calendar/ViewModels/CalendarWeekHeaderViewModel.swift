//
//  CalendarWeekHeaderViewModel.swift
//  Calendar
//
//  Created by Manish on 01/09/20.
//  Copyright © 2020 Manish. All rights reserved.
//

import Foundation

struct CalendarWeekHeaderViewModel: BaseViewModel {
    var id: Int // Day number in week

    let dayName: String
}

extension CalendarWeekHeaderViewModel {

    static func generateWeekDays() -> [CalendarWeekHeaderViewModel] {
        return Calendar
                .current
                .weekdaySymbols
                .enumerated()
                .map { (index, element) in CalendarWeekHeaderViewModel(id: index, dayName: element) }
    }

}
