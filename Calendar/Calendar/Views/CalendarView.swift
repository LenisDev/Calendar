//
//  CalendarView.swift
//  Calendar
//
//  Created by Manish on 25/08/20.
//  Copyright © 2020 Manish. All rights reserved.
//

import Foundation
import UIKit

public class CalendarView: BaseView<CalendarViewModel> {

    private(set) lazy var collectionViewLayout = UICollectionViewFlowLayout()
    private(set) lazy var calendarCV = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)

    private(set) var itemUnselectedStyle: Stylable = CapsuleShapeStyle()
    private(set) var itemSelectedStyle: Stylable = CapsuleBorderStyle()

    override func setupViews() {
        super.setupViews()

        calendarCV.sameSize(as: self.rootView)

        self.calendarCV.dataSource = self
        self.calendarCV.delegate = self

        self.calendarCV.register(DayViewCell.self)
    }

    override func setupData() {
        super.setupData()

        calendarCV.reloadData()
    }

}

extension CalendarView: UICollectionViewDelegate, UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView,
                               numberOfItemsInSection section: Int) -> Int {
        return self.data.items.count
    }

    public func collectionView(_ collectionView: UICollectionView,
                               cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(DayViewCell.self, for: indexPath)
        cell.data = data.items[indexPath.row]

        if cell.data?.state.rawValue == DayState.selected.rawValue {
            cell.style(itemSelectedStyle)
        } else {
            cell.style(itemUnselectedStyle)
        }

        return cell
    }




}

// MARK: - Style
public extension CalendarView {

    /// Style applied when item's state is unselected
    /// - Parameter style: style for view
    /// - Returns: `TabBarView`
    @discardableResult
    func itemUnselectedStyle(_ style: Stylable) -> Self {

        self.itemUnselectedStyle = style

        calendarCV.reloadData()

        return self
    }

    /// Style applied when item's state is selected
    /// - Parameter style: style for view
    /// - Returns: `TabBarView`
    @discardableResult
    func itemSelectedStyle(_ style: Stylable) -> Self {

        self.itemSelectedStyle = style

        calendarCV.reloadData()

        return self
    }

}
