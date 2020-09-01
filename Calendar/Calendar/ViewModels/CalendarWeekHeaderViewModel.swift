//
//  CalendarWeekHeaderViewModel.swift
//  Calendar
//
//  Created by Manish on 01/09/20.
//  Copyright © 2020 Manish. All rights reserved.
//

import Foundation

public struct CalendarWeekHeaderViewModel: BaseViewModel {
    public var id = UUID()

    let weekDays: [CalendarWeekDayViewModel]
}

public extension CalendarWeekHeaderViewModel {

    static func generateWeekDays() -> CalendarWeekHeaderViewModel {
        let weekDays = Calendar
                        .current
                        .weekdaySymbols
                        .enumerated()
                        .map { (index, element) in CalendarWeekDayViewModel(id: index, dayName: element) }

        return CalendarWeekHeaderViewModel(weekDays: weekDays)
    }

}
