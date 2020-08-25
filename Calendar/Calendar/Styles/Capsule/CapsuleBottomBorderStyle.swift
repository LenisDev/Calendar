//
//  CapsuleBottomBorderStyle.swift
//  Calendar
//
//  Created by Manish on 24/08/20.
//  Copyright © 2020 Manish. All rights reserved.
//

import UIKit

/// Provides capsule shape style
public struct CapsuleBottomBorderStyle: Stylable {

    public var bgColor: UIColor { .red }

    public var tintColor: UIColor { .white }

    public var border: Border { Border(color: .black, width: 2, edges: [.bottom]) }

    public var radius: Radius { Radius(size: 25, corners: [.allCorners]) }

    public init() { }

}
