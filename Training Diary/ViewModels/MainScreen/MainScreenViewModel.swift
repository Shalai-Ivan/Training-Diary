//
//  MainScreenViewModel.swift
//  Training Diary
//
//  Created by user on 02.09.2022.
//

import UIKit

class MainScreenViewModel: ExercisesViewModelType {
    var exercises: [Muscle]
    init(exercises: [Muscle]) {
        self.exercises = exercises
    }
    func getTitleMuscle() -> String {
        let array = MusclesViewModel.muscleTitle
        var tempArray: [String] = []
        for item in array where !tempArray.contains(item) {
            tempArray.append(item)
        }
        let result = tempArray.joined(separator: " ")
        print(result)
        return result
    }
}
extension MainScreenViewModel: TableViewViewModelType {
    func numberOfRows() -> Int {
        return exercises.count
    }
    func cellViewModel(forIndexPath indexPeth: IndexPath) -> TableViewCellViewModelType {
        let muscle = exercises[indexPeth.row]
        return MainScreenViewModelCell(muscle: muscle)
    }
}
