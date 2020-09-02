//
//  CalendarDayStyle.swift
//  CalendarExamples
//
//  Created by Manish on 02/09/20.
//  Copyright © 2020 Manish. All rights reserved.
//

import Foundation
import Calendar

struct CalendarDayStyle: DayStylable {

    var today: Stylable? = RoundStyle()

    var selected: Stylable? = RectBorderStyle()

    var unselected: Stylable? = DefaultStyle()

}
