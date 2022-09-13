//
//  TableViewDeletingCellsType.swift
//  Training Diary
//
//  Created by MacMini on 7.09.22.
//

import UIKit

protocol TableViewCellSettingsType {
    func delete(forIndexPath indexPath: IndexPath)
    func addImageTapRecognizer(image: UIImageView)
}
