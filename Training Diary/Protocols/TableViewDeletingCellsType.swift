//
//  TableViewDeletingCellsType.swift
//  Training Diary
//
//  Created by MacMini on 7.09.22.
//

import Foundation
import UIKit

protocol TableViewDeletingCellsType {
    func delete(forIndexPath indexPath: IndexPath)
}
