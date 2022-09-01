//
//  ExercisesViewModel.swift
//  Training Diary
//
//  Created by MacMini on 31.08.22.
//

import UIKit

class ExercisesViewModel: ExercisesViewModelType {
    var exercises: [Muscle]
    
    init(exercises: [Muscle]) {
        self.exercises = exercises
    }
    
}

extension ExercisesViewModel: TableViewViewModelType {
    func numberOfRows() -> Int {
        return exercises.count
    }
    func cellViewModel(forIndexPath indexPeth: IndexPath) -> TableViewCellViewModelType {
        let muscle = exercises[indexPeth.row]
        return ExercisesViewModelCell(muscle: muscle)
    }
}
