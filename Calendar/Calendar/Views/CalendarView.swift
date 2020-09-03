//
//  CalendarView.swift
//  Calendar
//
//  Created by Manish on 01/09/20.
//  Copyright © 2020 Manish. All rights reserved.
//

import Foundation
import UIKit


public class CalendarView: BaseView<CalendarViewModel> {

    private(set) var onDaySelected: ((DayViewModel) -> Void)!
    private(set) lazy var weekHeaderView = CalendarWeekHeaderView(data: self.data.weekDays)
    private(set) lazy var calendarDayListView = CalendarDayListView(data: self.data.days, onDaySelected: onDaySelected)

    private(set) lazy var rootSV = UIStackView(arrangedSubViews: [self.weekHeaderView, self.calendarDayListView],
                                               distribution: .fill)

    public init(data: CalendarViewModel, onDaySelected: @escaping (DayViewModel) -> Void) {
        self.onDaySelected = onDaySelected

        super.init(data: data)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setupViews() {
        super.setupViews()

        self.rootSV.sameSize(as: self)
    }

}

public extension CalendarView {

    @discardableResult
    func dayStyle(_ style: DayStylable) -> CalendarView {

        if let unselectedItemStyle = style.unselected {
            self.calendarDayListView.itemUnselectedStyle(unselectedItemStyle)
        }

        if let selectedItemStyle = style.selected {
            self.calendarDayListView.itemSelectedStyle(selectedItemStyle)
        }

        if let todayItemStyle = style.today {
            self.calendarDayListView.itemTodayStyle(todayItemStyle)
        }


        return self
    }

    @discardableResult
    func weekHeaderStyle(_ style: Stylable) -> CalendarView {
        self.weekHeaderView.style(style)

        return self
    }

    @discardableResult
    func dayPresentation(_ state: CalendarViewState) -> CalendarView {
        self.calendarDayListView.state(state)

        return self
    }
}
