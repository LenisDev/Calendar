//
//  CapsuleBorderStyle.swift
//  Calendar
//
//  Created by Manish on 24/08/20.
//  Copyright © 2020 Manish. All rights reserved.
//

import UIKit

struct CapsuleBorderStyle: Stylable {

    var bgColor: UIColor { .white }

    var tintColor: UIColor { .black }

    var border: Border { Border(color: .red, width: 2, edges: [.all]) }

    var radius: Radius { Radius(size: 25, corners: [.allCorners]) }

    public init() { }
    
}

