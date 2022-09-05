//
//  TableViewDataTransferType.swift
//  Training Diary
//
//  Created by user on 01.09.2022.
//

import Foundation

protocol TableViewDataTransferType {
    func didSelectRow(forIndexPath indexPath: IndexPath)
    func viewModelForSelectedRow() -> ExercisesViewModelType?
}
