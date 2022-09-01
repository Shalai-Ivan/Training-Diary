//
//  ExercisesViewModelCell.swift
//  Training Diary
//
//  Created by MacMini on 31.08.22.
//

import UIKit

class ExercisesViewModelCell: TableViewCellViewModelType {

    private var muscle: Muscle
    var text: String {
        return muscle.text
    }
    var image: UIImage {
        return muscle.image
    }
    init(muscle: Muscle) {
        self.muscle = muscle
    }
}
