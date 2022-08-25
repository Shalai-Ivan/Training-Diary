//
//  UsefulTableView.swift
//  Training Diary
//
//  Created by user on 23.08.2022.
//

import UIKit

struct UsefulTableView {
    private func toSetCellValues(cell: Int) -> (String, UIImage) {
        switch cell {
        case 0:
            return (UsefulTableViewCellTitles.zero.rawValue, (UIImage.init(named: "dumbbell")!))
        case 1:
            return (UsefulTableViewCellTitles.one.rawValue, (UIImage.init(named: "increase")!))
        case 2:
            return (UsefulTableViewCellTitles.two.rawValue, (UIImage.init(named: "calculator")!))
        case 3:
            return (UsefulTableViewCellTitles.three.rawValue, (UIImage.init(named: "tape")!))
        case 4:
            return (UsefulTableViewCellTitles.four.rawValue, (UIImage.init(named: "notepad")!))
        default:
            return ("", UIImage())
        }
    }
    static func toFillCells(cell: UITableViewCell, number: Int) -> UITableViewCell {
        cell.textLabel?.text = UsefulTableView().toSetCellValues(cell: number).0
        cell.imageView?.image = UsefulTableView().toSetCellValues(cell: number).1
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = .systemFont(ofSize: 20)
        return cell
    }
}
