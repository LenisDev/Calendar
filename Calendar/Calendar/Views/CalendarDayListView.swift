//
//  CalendarDayListView.swift
//  Calendar
//
//  Created by Manish on 25/08/20.
//  Copyright © 2020 Manish. All rights reserved.
//

import Foundation
import UIKit

/// Calendar presentation view
public class CalendarDayListView: BaseView<CalendarDayListViewModel> {

    // MARK: - Properties
    /// `UICollectionViewFlowLayout` for `calendarCV` collectionview
    private(set) lazy var collectionViewLayout = UICollectionViewFlowLayout()

    /// `UICollectionView` used to display dates in for month
    private(set) lazy var calendarCV = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)

    /// Unselected item style
    private(set) var itemUnselectedStyle: Stylable = CapsuleShapeStyle()

    /// Selected item style
    private(set) var itemSelectedStyle: Stylable = CapsuleBorderStyle()

    /// Calendar presentation state
    private(set) var state = CalendarViewState.expanded {
        didSet {
            self.setupCollectionViewLayout()
        }
    }

    /// Closure confirming to day selection
    private(set) var onDaySelected: (DayViewModel) -> Void

    // MARK: - Init
    /// Initializes `CalendarView` with data provided
    /// - Parameters:
    ///   - data: contains days to shown for month
    ///   - onDaySelected: closure invoked when day is selected
    public init(data: CalendarDayListViewModel,
                onDaySelected: @escaping (DayViewModel) -> Void) {
        self.onDaySelected = onDaySelected

        super.init(data: data)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setups
    override func setupViews() {
        super.setupViews()

        self.setupCollectionViewLayout()
        self.calendarCV.sameSize(as: self.rootView)

        self.calendarCV.dataSource = self
        self.calendarCV.delegate = self
        self.calendarCV.backgroundColor = .clear

        self.calendarCV.register(DayViewCell.self)
    }

    override func setupData() {
        super.setupData()

        calendarCV.reloadData()
    }

}

extension CalendarDayListView: UICollectionViewDelegate, UICollectionViewDataSource, DayViewDelegate, UICollectionViewDelegateFlowLayout {

    private func setupCollectionViewLayout() {
        self.collectionViewLayout.scrollDirection = self.state == .collapsed ? .horizontal : .vertical
        self.calendarCV.isPagingEnabled = true

        self.collectionViewLayout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        self.collectionViewLayout.minimumInteritemSpacing = 5
        self.collectionViewLayout.minimumLineSpacing = 5
    }

    public func collectionView(_ collectionView: UICollectionView,
                               numberOfItemsInSection section: Int) -> Int {
        return self.data.items.count
    }

    public func collectionView(_ collectionView: UICollectionView,
                               cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(DayViewCell.self, for: indexPath)
        cell.data = data.items[indexPath.row]
        cell.delegate = self

        if cell.data?.state.rawValue == DayState.selected.rawValue {
            cell.style(itemSelectedStyle)
        } else {
            cell.style(itemUnselectedStyle)
        }

        return cell
    }

    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAt indexPath: IndexPath) -> CGSize {
        // One extra block for spacing
        return CGSize(width: collectionView.bounds.size.width / 8, height: collectionView.bounds.size.width / 8)
    }

    public func didSelectDay(_ day: DayViewModel) {
        self.onDaySelected(day)

        self.data.changeDateSelection(to: day.date)

        self.calendarCV.reloadData()
    }

}

// MARK: - Style
public extension CalendarDayListView {

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

public extension CalendarDayListView {

    /// Helper for loading days for given month
    /// - Parameters:
    ///   - month: date object with month to be loaded
    ///   - selectDay: day which should be selected
    /// - Returns: Self
    @discardableResult
    func loadDatesFor(month: Date, selectDay: Int?) -> Self {
        self.data.loadDatesFor(month: month, selectDay: selectDay)

        return self
    }

    /// Changes `CalendarView`'s presentation state
    /// - Parameter state: new state - `CalendarViewState`
    /// - Returns: Self
    @discardableResult
    func state(_ state: CalendarViewState) -> Self {
        self.state = state

        return self
    }

}
