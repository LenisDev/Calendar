//
//  RectBottomBorderStyle.swift
//  Calendar
//
//  Created by Manish on 24/08/20.
//  Copyright © 2020 Manish. All rights reserved.
//

import UIKit

public struct RectBottomBorderStyle: Stylable {

    public var bgColor: UIColor { .white }

    public var tintColor: UIColor { .black }

    public var border: Border { Border(color: .red, width: 2, edges: [.bottom]) }

    public var radius: Radius { .none }

    public init() { }

}
