//
//  RectBorderStyle.swift
//  CalendarExamples
//
//  Created by Manish on 02/09/20.
//  Copyright © 2020 Manish. All rights reserved.
//

import UIKit
import Calendar

struct RectBorderStyle: Stylable {

    var bgColor: UIColor { UIColor.lightGray.withAlphaComponent(0.5) }

    var tintColor: UIColor { .systemRed }

    var border: Border { Border(color: .systemRed, width: 2, edges: [.bottom]) }

    var radius: Radius { .none }


}
