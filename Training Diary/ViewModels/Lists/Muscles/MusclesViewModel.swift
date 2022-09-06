//
//  ListMusclesViewModel.swift
//  Training Diary
//
//  Created by user on 29.08.2022.
//

import UIKit

class MusclesViewModel: TableViewViewModelType {
    static var muscleTitle: [String] = []
    static func deleteMuscleTitle() {
        muscleTitle.removeLast()
    }
    private var selectedIndexPath: IndexPath? {
        didSet {
            guard let indexPath = selectedIndexPath else { return }
            MusclesViewModel.muscleTitle.append(muscles[indexPath.row].text)
        }
    }
    private var muscles = [
        Muscle(image: UIImage(named: "chest")!, text: "Грудь"),
        Muscle(image: UIImage(named: "back")!, text: "Спина"),
        Muscle(image: UIImage(named: "legs")!, text: "Ноги"),
        Muscle(image: UIImage(named: "arms")!, text: "Руки")]
    private var exercises: [Muscle] {
        switch selectedIndexPath?.row {
        case 0:
            return [Muscle(image: UIImage(named: "bench-press")!, text: "Жим штанги лежа"),
                    Muscle(image: UIImage(named: "push-up")!, text: "Отжимания от пола"),
                    Muscle(image: UIImage(named: "dip-bar")!, text: "Отжимания на брусьях")]
        case 1:
            return [Muscle(image: UIImage(named: "weightlifter")!, text: "Тяга штанги в наклоне"),
                    Muscle(image: UIImage(named: "gym")!, text: "Тяга верхнего блока"),
                    Muscle(image: UIImage(named: "gym-1")!, text: "Подтягивания на перекладине")]
        case 2:
            return [Muscle(image: UIImage(named: "weightlifting")!, text: "Приседания со штангой"),
                    Muscle(image: UIImage(named: "rowing")!, text: "Становая тяга"),
                    Muscle(image: UIImage(named: "weightlift")!, text: "Выпады")]
        case 3:
            return [Muscle(image: UIImage(named: "weight-lifting")!, text: "Сгибание рук со штангой"),
                    Muscle(image: UIImage(named: "workout")!, text: "Сгибание рук с гантелями"),
                    Muscle(image: UIImage(named: "lifting")!, text: "Жим штанги узким хватом"),
                    Muscle(image: UIImage(named: "gym-bars")!, text: "Разгибание рук на блоке")]
        default:
            return []
        }
    }
    func numberOfRows() -> Int {
        return muscles.count
    }
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType {
        let muscle = muscles[indexPath.row]
        return MusclesViewModelCell(muscle: muscle)
    }
}

extension MusclesViewModel: TableViewDataTransferType {
    func didSelectRow(forIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
    func viewModelForSelectedRow() -> ExercisesViewModelType? {
        return ExercisesViewModel(exercises: exercises)
    }
}
