//
//  SettingsTableViewCell.swift
//  Training Diary
//
//  Created by MacMini on 19.09.22.
//

import UIKit

class UsefulTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabelUseful: UILabel!
    @IBOutlet weak var imageViewUseful: UIImageView!
    weak var viewModel: TableViewCellViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            titleLabelUseful.text = viewModel.text
            imageViewUseful.image = viewModel.image
        }
    }
}
