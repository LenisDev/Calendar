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
    func weekHeaderViewStyle(_ style: Stylable) -> Self {
        self.weekHeaderView.style(style)

        return self
    }

    @discardableResult
    func itemUnselectedStyle(_ style: Stylable) -> Self {
        self.calendarDayListView.itemUnselectedStyle(style)

        return self
    }

    @discardableResult
    func itemSelectedStyle(_ style: Stylable) -> Self {
        self.calendarDayListView.itemSelectedStyle(style)

        return self
    }

}
