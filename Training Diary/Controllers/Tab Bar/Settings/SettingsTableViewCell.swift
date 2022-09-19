//
//  SettingsTableViewCell.swift
//  Training Diary
//
//  Created by MacMini on 16.09.22.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    weak var viewModel: TableViewCellViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            titleLabel.text = viewModel.text
        }
    }
    @IBAction func didTapSwitchAction(_ sender: UISwitch) {
    }
}
