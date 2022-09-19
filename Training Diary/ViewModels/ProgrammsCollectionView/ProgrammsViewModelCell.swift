//
//  CollectionViewCell.swift
//  Training Diary
//
//  Created by MacMini on 23.08.22.
//

import UIKit

class ProgrammsViewModelCell: TableViewCellViewModelType {
    var image: UIImage
    var text: String
    var bottomText: String
    var color: UIColor
    init(image: UIImage, text: String, bottomText: String, color: UIColor) {
        self.image = image
        self.text = text
        self.bottomText = bottomText
        self.color = color
    }
}
