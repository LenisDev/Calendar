//
//  CalendarViewModel.swift
//  Calendar
//
//  Created by Manish on 25/08/20.
//  Copyright © 2020 Manish. All rights reserved.
//

import Foundation


/// Calendar view presentation state
public enum CalendarViewState {
    case expanded
    case collapsed
}


/// Data view model for calendar view
public struct CalendarDayListViewModel: BaseViewModel {
    public var id = UUID()

    /// Data array for displaying list of dates
    private(set) var items = [DayViewModel]()

    /// Initializer, loads current month dates by default
    public init() {
        self.loadDatesFor(month: Date(), selectDay: Date().day)
    }
}

public extension CalendarDayListViewModel {

    /// Generates and add `DayViewModel` array to `items`, which represents days in month
    /// - Parameters:
    ///   - month: Date object
    ///   - selectDay: day that should be selected (optional)
    mutating func loadDatesFor(month: Date, selectDay: Int?) {
        let dates = CalendarDate().generateDatesForMonth(from: month)

        self.items = dates.map { DayViewModel(id: $0.day.description, date: $0, state: ($0.day == selectDay) ? .selected : .unSelected) }
    }

    /// Changes date selection to given date object
    /// - Parameter date: date object, cotaining date to be selected
    mutating func changeDateSelection(to date: Date) {
        for index in self.items.indices {
            if self.items[index].date.day == date.day {
                self.items[index].state = .selected
            } else {
                self.items[index].state = .unSelected
            }
        }
    }

}
