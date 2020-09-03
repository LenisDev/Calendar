//
//  CalendarWeekHeaderView.swift
//  Calendar
//
//  Created by Manish on 01/09/20.
//  Copyright © 2020 Manish. All rights reserved.
//

import UIKit

class CalendarWeekHeaderView: BaseView<CalendarWeekHeaderViewModel> {

    override var intrinsicContentSize: CGSize { CGSize(width: self.frame.width, height: 50) }
    
    private(set) lazy var rootSV = UIStackView(arrangedSubViews: [], axis: .horizontal)

    override func setupViews() {
        super.setupViews()

        // reset
        self.rootSV.removeFromSuperview()
        self.rootSV.removeAllArrangedSubviews()
        self.rootSV.sameSize(as: self)
    }

    override func setupData() {
        super.setupData()

        self.data
            .weekDays
            .forEach { day in
                self.rootSV.addArrangedSubview(CalendarWeekDayView(data: day))
            }
    }

    @discardableResult
    override func tintColor(_ color: UIColor) -> Self {

        self.rootSV
            .arrangedSubviews
            .forEach {
                ($0 as? CalendarWeekDayView)?.tintColor(color)
            }

        return self
    }

}
