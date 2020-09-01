//
//  CalendarWeekDayView.swift
//  Calendar
//
//  Created by Manish on 01/09/20.
//  Copyright © 2020 Manish. All rights reserved.
//

import UIKit

class CalendarWeekDayView: BaseView<CalendarWeekDayViewModel> {

    private(set) lazy var dayNameLbl = UILabel()

    override func setupViews() {
        super.setupViews()

        self.dayNameLbl.sameSize(as: self)
    }

    override func setupData() {
        super.setupData()

        self.dayNameLbl.textAlignment = .center
        self.dayNameLbl.text = data.dayName.first?.description
    }

}
