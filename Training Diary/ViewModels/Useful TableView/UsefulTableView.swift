//
//  UsefulTableView.swift
//  Training Diary
//
//  Created by user on 23.08.2022.
//

import UIKit

struct UsefulTableView {
    private var arrayFieldName: [String] {
        get {
            var array = [String]()
            for item in UsefulFieldNames.allCases {
                array.append(item.rawValue)
            }
            return array
        }
    }
    private var arrayImages: [UIImage?] {
        get {
            var array = [UIImage?]()
            for item in UsefulFieldImages.allCases {
                array.append(UIImage(named: item.rawValue))
            }
            return array
        }
    }

    static func toFillCells(cell: UITableViewCell, number: Int) -> UITableViewCell {
        cell.textLabel?.text = UsefulTableView().arrayFieldName[number]
        cell.imageView?.image = UsefulTableView().arrayImages[number]
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = .systemFont(ofSize: 20)
        return cell
    }
}
