//
//  SettingsTableViewCell.swift
//  Training Diary
//
//  Created by MacMini on 25.08.22.
//

import UIKit

class SettingsViewModelCell: TableViewCellViewModelType {
    var text: String
    var image = UIImage()
    init(text: String) {
        self.text = text
    }
}
