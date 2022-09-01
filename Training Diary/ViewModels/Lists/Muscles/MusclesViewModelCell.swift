//
//  ListMusclesViewModelCell.swift
//  Training Diary
//
//  Created by user on 29.08.2022.
//

import UIKit

class MusclesViewModelCell: TableViewCellViewModelType {

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
