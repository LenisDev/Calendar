//
//  CalendarWeekHeaderView.swift
//  Calendar
//
//  Created by Manish on 01/09/20.
//  Copyright © 2020 Manish. All rights reserved.
//

import UIKit

class CalendarWeekHeaderView: BaseView<CalendarWeekHeaderViewModel> {

    private(set) lazy var dayNameLbl = UILabel()

    override func setupViews() {
        super.setupViews()

        self.dayNameLbl.sameSize(as: self)
    }

    override func setupData() {
        super.setupData()

        self.dayNameLbl.text = data.dayName
    }

}
