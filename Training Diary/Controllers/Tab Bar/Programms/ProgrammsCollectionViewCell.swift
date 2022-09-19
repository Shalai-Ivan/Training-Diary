//
//  CollectionViewCell.swift
//  Training Diary
//
//  Created by MacMini on 19.09.22.
//

import UIKit

class ProgrammsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var bottomTitleLabel: UILabel!
    @IBOutlet weak var topTitleLabel: UILabel!
    @IBOutlet weak var imageViewProgramms: UIImageView!
    weak var viewModel: ProgrammsViewModelCell? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            bottomTitleLabel.text = viewModel.bottomText
            topTitleLabel.text = viewModel.text
            imageViewProgramms.image = viewModel.image
            bottomTitleLabel.backgroundColor = viewModel.color
        }
    }
}
