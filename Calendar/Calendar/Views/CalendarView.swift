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

    private(set) lazy var calendarCV = UICollectionView()

    override func setupViews() {
        super.setupViews()

        self.calendarCV.dataSource = self
        self.calendarCV.delegate = self
    }

    override func setupData() {
        super.setupData()

    }

}

extension CalendarView: UICollectionViewDelegate, UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView,
                               numberOfItemsInSection section: Int) -> Int {
        return 0
    }

    public func collectionView(_ collectionView: UICollectionView,
                               cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }




}
