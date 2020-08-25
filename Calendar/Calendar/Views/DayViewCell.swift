//
//  DayViewCell.swift
//  Calendar
//
//  Created by Manish on 25/08/20.
//  Copyright © 2020 Manish. All rights reserved.
//

import Foundation
import UIKit

class DayViewCell: BaseCell<DayViewModel> {

    private(set) lazy var dayLbl = UILabel()

    override func setupViews() {
        super.setupViews()

        self.dayLbl.textAlignment = .center
        self.dayLbl.center(to: rootView)
    }

    override func setupData() {
        super.setupData()

        self.dayLbl.text = data.date.day.description
    }

    override func tintColor(_ color: UIColor) -> Self {
        super.tintColor(color)

        self.dayLbl.textColor = color

        return self
    }

}
