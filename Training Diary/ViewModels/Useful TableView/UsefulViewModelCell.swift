//
//  UsefulViewModelCell.swift
//  Training Diary
//
//  Created by MacMini on 19.09.22.
//

import UIKit

class UsefulViewModelCell: TableViewCellViewModelType {
    private var field: Muscle
    var image: UIImage {
        return field.image
    }
    var text: String {
        return field.text
    }
    init(field: Muscle) {
        self.field = field
    }
}
