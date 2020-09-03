//
//  CalendarViewModel.swift
//  Calendar
//
//  Created by Manish on 01/09/20.
//  Copyright © 2020 Manish. All rights reserved.
//

import Foundation

public struct CalendarViewModel: BaseViewModel {
    public var id = UUID()

    let days: CalendarDayListViewModel
    let weekDays: CalendarWeekHeaderViewModel

    public init(days: CalendarDayListViewModel, weekDays: CalendarWeekHeaderViewModel) {
        self.days = days
        self.weekDays = weekDays
    }
}
