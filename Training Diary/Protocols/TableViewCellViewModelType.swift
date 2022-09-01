//
//  TableViewCellViewModelType.swift
//  Training Diary
//
//  Created by user on 29.08.2022.
//

import UIKit

protocol TableViewCellViewModelType: AnyObject {
    var image: UIImage { get }
    var text: String { get }
}
