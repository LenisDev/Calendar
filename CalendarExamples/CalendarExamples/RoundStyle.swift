//
//  RoundStyle.swift
//  CalendarExamples
//
//  Created by Manish on 02/09/20.
//  Copyright © 2020 Manish. All rights reserved.
//

import UIKit
import Calendar

struct RoundStyle: Stylable {

    var bgColor: UIColor { UIColor.lightGray.withAlphaComponent(0.2) }

    var tintColor: UIColor { .systemBlue }

    var border: Border { .none }

    var radius: Radius { Radius(size: 22, corners: [.allCorners]) }

}
