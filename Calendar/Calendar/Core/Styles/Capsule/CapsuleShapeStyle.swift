//
//  CapsuleShapeStyle.swift
//  Calendar
//
//  Created by Manish on 23/08/20.
//  Copyright © 2020 Manish. All rights reserved.
//

import UIKit

/// Provides capsule shape style
public struct CapsuleShapeStyle: Stylable {

    public var bgColor: UIColor { .clear }

    public var tintColor: UIColor { .black }

    public var border: Border { .none }

    public var radius: Radius { Radius(size: 22, corners: [.allCorners]) }

    public init() { }
}
