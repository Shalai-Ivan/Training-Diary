//
//  ExercisesViewModel.swift
//  Training Diary
//
//  Created by MacMini on 31.08.22.
//

import UIKit

class ExercisesViewModel: ExercisesViewModelType {
    var exercises: [Muscle]
    var chosenExercises: [Muscle] = []
    init(exercises: [Muscle]) {
        self.exercises = exercises
    }
}

// MARK: - Extensions

extension ExercisesViewModel: TableViewViewModelType {
    func numberOfRows() -> Int {
        return exercises.count
    }
    func cellViewModel(forIndexPath indexPeth: IndexPath) -> TableViewCellViewModelType {
        let muscle = exercises[indexPeth.row]
        return ExercisesViewModelCell(muscle: muscle)
    }
}

extension ExercisesViewModel: TableViewDataTransferType {
    func didSelectRow(forIndexPath indexPath: IndexPath) {
        return
    }
    func viewModelForSelectedRow() -> ExercisesViewModelType? {
        return MainScreenViewModel(exercises: chosenExercises)
    }
}
