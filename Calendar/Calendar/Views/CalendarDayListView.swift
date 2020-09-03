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

    /// Today item style
    private(set) var itemTodayStyle: Stylable = CapsuleBorderStyle()

    /// Selected item style
    private(set) var itemSelectedStyle: Stylable = CapsuleBorderStyle()

    /// Unselected item style
    private(set) var itemUnselectedStyle: Stylable = CapsuleShapeStyle()

    /// Calendar presentation state
    private(set) var state = CalendarViewState.expanded {
        didSet {
            self.setupCollectionViewLayout()
        }
    }

    // number of days should be left before starting current month
    private(set) lazy var paddingNumberDaysBefore = 0
    private(set) lazy var paddingNumberDaysAfter = 0

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
        self.calendarCV.register(UICollectionViewCell.self)
    }

    override func setupData() {
        super.setupData()

        self.checkAndSetupDaysForPadding()
        self.calendarCV.reloadData()
    }

    private func checkAndSetupDaysForPadding() {

        guard let safeFirstDay = data.items.first else { return }

        while !safeFirstDay.isSameWeekDay(of: self.paddingNumberDaysBefore) {
            self.paddingNumberDaysBefore += 1
        }

        guard let safeLastDay = data.items.last else { return }

        while !safeLastDay.isLastDayOfWeek(paddingDay: self.paddingNumberDaysAfter) {
            self.paddingNumberDaysAfter += 1
        }
        
    }

}

extension CalendarDayListView: UICollectionViewDelegate, UICollectionViewDataSource, DayViewDelegate, UICollectionViewDelegateFlowLayout {

    private func setupCollectionViewLayout() {
        self.collectionViewLayout.scrollDirection = self.state == .collapsed ? .horizontal : .vertical
        self.calendarCV.isPagingEnabled = true

        self.collectionViewLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.collectionViewLayout.minimumInteritemSpacing = 0
        self.collectionViewLayout.minimumLineSpacing = 0
    }

    public func collectionView(_ collectionView: UICollectionView,
                               numberOfItemsInSection section: Int) -> Int {
        return self.data.items.count + self.paddingNumberDaysBefore + self.paddingNumberDaysAfter
    }

    public func collectionView(_ collectionView: UICollectionView,
                               cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if indexPath.row >= self.paddingNumberDaysBefore &&
            (data.items.count + self.paddingNumberDaysBefore) > indexPath.row {

            let cell = collectionView.dequeue(DayViewCell.self, for: indexPath)
            cell.data = data.items[indexPath.row - self.paddingNumberDaysBefore]
            cell.delegate = self


            let isSelected = cell.data?.state.rawValue == DayState.selected.rawValue

            if cell.data?.date.isToday == true && !isSelected { // !isSelected -> to avoid unwanted override
                cell.style(self.itemTodayStyle)
            } else if isSelected {
                cell.style(self.itemSelectedStyle)
            } else {
                cell.style(self.itemUnselectedStyle)
            }

            return cell
        } else {
            return collectionView.dequeue(UICollectionViewCell.self, for: indexPath)
        }

    }

    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAt indexPath: IndexPath) -> CGSize {
        // One extra block for spacing
        return CGSize(width: collectionView.bounds.size.width / 7, height: collectionView.bounds.size.width / 7)
    }

    public func didSelectDay(_ day: DayViewModel) {
        self.data.changeDateSelection(to: day.date)

        self.calendarCV.reloadData()

        self.onDaySelected(day)
    }

}

// MARK: - Style
public extension CalendarDayListView {

    /// Style applied when item's state is unselected
    /// - Parameter style: style for view
    /// - Returns: `CalendarDayListView`
    @discardableResult
    func itemTodayStyle(_ style: Stylable) -> Self {

        self.itemTodayStyle = style

        self.calendarCV.reloadData()

        return self
    }

    /// Style applied when item's state is unselected
    /// - Parameter style: style for view
    /// - Returns: `CalendarDayListView`
    @discardableResult
    func itemUnselectedStyle(_ style: Stylable) -> Self {

        self.itemUnselectedStyle = style

        self.calendarCV.reloadData()

        return self
    }

    /// Style applied when item's state is selected
    /// - Parameter style: style for view
    /// - Returns: `CalendarDayListView`
    @discardableResult
    func itemSelectedStyle(_ style: Stylable) -> Self {

        self.itemSelectedStyle = style

        self.calendarCV.reloadData()

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
