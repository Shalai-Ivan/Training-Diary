//
//  MianScrenCellViewModel.swift
//  Training Diary
//
//  Created by user on 02.09.2022.
//

import UIKit

class MainScreenViewModelCell: TableViewCellViewModelType {
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
