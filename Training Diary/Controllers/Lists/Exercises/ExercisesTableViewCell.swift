//
//  ExercisesTableViewCell.swift
//  Training Diary
//
//  Created by MacMini on 31.08.22.
//

import UIKit

class ExercisesTableViewCell: UITableViewCell {
    @IBOutlet private weak var imageViewExercise: UIImageView!
    @IBOutlet private weak var titleLabelExercise: UILabel!
    weak var viewModel: TableViewCellViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            imageViewExercise.image = viewModel.image
            titleLabelExercise.text = viewModel.text
        }
    }
}
