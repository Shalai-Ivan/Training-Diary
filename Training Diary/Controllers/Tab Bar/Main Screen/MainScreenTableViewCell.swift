//
//  MainScreenTableViewCell.swift
//  Training Diary
//
//  Created by user on 02.09.2022.
//

import UIKit

class MainScreenTableViewCell: UITableViewCell {
    @IBOutlet private weak var imageViewMain: UIImageView!
    @IBOutlet private weak var titleLabelMain: UILabel!
    @IBOutlet private weak var plusButton: UIButton!
    weak var viewModel: TableViewCellViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            imageViewMain.image = viewModel.image
            titleLabelMain.text = viewModel.text
        }
    }
    var delegate: TableViewDeletingCellsType?
    var indexPath: IndexPath?
    @IBAction private func didTapPlusButton(_ sender: Any) {
    }
    @IBAction private func didTapDeleteButton(_ sender: UIButton) {
        guard let indexPath = indexPath else { return }
        delegate?.delete(forIndexPath: indexPath)
    }
}
extension MainScreenTableViewCell: UITableViewDelegate { }
