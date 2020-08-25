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

    let calendarView = CalendarView(data: CalendarViewModel())

    override func viewDidLoad() {
        super.viewDidLoad()

        calendarView
            .with(width: 350, height: 60)
            .center(to: view)
        
    }


}

