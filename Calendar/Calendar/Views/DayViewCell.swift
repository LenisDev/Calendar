//
//  DayViewCell.swift
//  Calendar
//
//  Created by Manish on 25/08/20.
//  Copyright © 2020 Manish. All rights reserved.
//

import Foundation
import UIKit

public protocol DayViewDelegate: class {
    func didSelectDay(_ day: DayViewModel)
}

class DayViewCell: BaseCell<DayViewModel> {

    private(set) lazy var dayLbl = UILabel()
    public weak var delegate: DayViewDelegate?

    override func setupViews() {
        super.setupViews()

        self.dayLbl.textAlignment = .center
        self.dayLbl.center(to: rootView)

        self.rootView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTapGesture)))
    }

    override func setupData() {
        super.setupData()

        self.dayLbl.text = data?.date.day.description
    }

    override func tintColor(_ color: UIColor) -> Self {
        super.tintColor(color)

        self.dayLbl.textColor = color

        return self
    }

}

extension DayViewCell {

    @objc private func onTapGesture() {
        var day = data!
        day.state = .selected

        self.delegate?.didSelectDay(day)
    }

}
