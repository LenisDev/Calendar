//
//  CalendarViewModel.swift
//  Calendar
//
//  Created by Manish on 25/08/20.
//  Copyright © 2020 Manish. All rights reserved.
//

import Foundation

public enum CalendarViewState {
    case expanded
    case collapsed
}

public struct CalendarViewModel: BaseViewModel {
    public var id = UUID()

    private(set) var items = [DayViewModel]()

    public init() {
        self.loadDatesFor(month: Date(), selectDay: Date().day)
    }
}

public extension CalendarViewModel {

    mutating func loadDatesFor(month: Date, selectDay: Int?) {
        let dates = CalendarDate().generateDatesForMonth(from: month)

        self.items = dates.map { DayViewModel(id: $0.day.description, date: $0, state: ($0.day == selectDay) ? .selected : .unSelected) }
    }

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
