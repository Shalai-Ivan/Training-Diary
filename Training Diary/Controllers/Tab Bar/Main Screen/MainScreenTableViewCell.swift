//
//  MainScreenTableViewCell.swift
//  Training Diary
//
//  Created by user on 02.09.2022.
//

import UIKit

class MainScreenTableViewCell: UITableViewCell {
    @IBOutlet weak var imageViewMain: UIImageView!
    @IBOutlet weak var titleLabelMain: UILabel!
    weak var viewModel: TableViewCellViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            imageViewMain.image = viewModel.image
            titleLabelMain.text = viewModel.text
        }
    }
    @IBAction func didTapPlusButton(_ sender: Any) {
    }
    @IBAction func didTapSettingsButton(_ sender: Any) {
    }
}
