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
        return 3
    }

    public func collectionView(_ collectionView: UICollectionView,
                               cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(DayViewCell.self, for: indexPath)
        cell.data = DayViewModel(id: UUID().description, date: Date())

        return cell
    }




}
