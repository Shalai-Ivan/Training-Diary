//
//  ListMusclesTableViewCell.swift
//  Training Diary
//
//  Created by user on 29.08.2022.
//

import UIKit

class MusclesTableViewCell: UITableViewCell {
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
