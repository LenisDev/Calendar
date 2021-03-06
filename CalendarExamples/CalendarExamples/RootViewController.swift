//
//  RootViewController.swift
//  CalendarExamples
//
//  Created by Manish on 25/08/20.
//  Copyright © 2020 Manish. All rights reserved.
//

import UIKit
import Calendar

class RootViewController: UIViewController {

    let calendarView = CalendarView(data: CalendarViewModel(days: CalendarDayListViewModel(), weekDays: CalendarWeekHeaderViewModel.generateWeekDays())) { selectedDay in
        print(selectedDay)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white

        calendarView
            .with(width: 350)
            .center(to: view)
            .dayStyle(CalendarDayStyle())
            .weekHeaderStyle(DefaultStyle())
            .dayPresentation(.expanded)

            //.style(RectShapeStyle())
            //.state(.expanded)
            //.itemUnselectedStyle(CapsuleShapeStyle())
            //.itemSelectedStyle(CapsuleBorderStyle())
        
    }


}

