//
//  ExercisesTableViewCell.swift
//  Training Diary
//
//  Created by MacMini on 31.08.22.
//

import UIKit

class ExercisesTableViewCell: UITableViewCell {
    @IBOutlet weak var imageViewMuscle: UIImageView!
    @IBOutlet weak var titleLabelMuscle: UILabel!
    weak var viewModel: TableViewCellViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            imageViewMuscle.image = viewModel.image
            titleLabelMuscle.text = viewModel.text
        }
    }
}
