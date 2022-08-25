//
//  CollectionViewTitles.swift
//  Training Diary
//
//  Created by user on 23.08.2022.
//

import UIKit

struct CollectionViewTitles {
    private func toSetTitlesValues(cell: Int) -> (String, String, UIColor) {
        switch cell {
        case 0:
            return (ProgrammNames.zero.rawValue, ProgrammLevels.beginner.rawValue, .systemGreen)
        case 1:
            return (ProgrammNames.one.rawValue, ProgrammLevels.middle.rawValue, .systemYellow)
        case 2:
            return (ProgrammNames.two.rawValue, ProgrammLevels.pro.rawValue, .systemRed)
        case 3:
            return (ProgrammNames.three.rawValue, ProgrammLevels.beginner.rawValue, .systemGreen)
        case 4:
            return (ProgrammNames.four.rawValue, ProgrammLevels.pro.rawValue, .systemRed)
        case 5:
            return (ProgrammNames.five.rawValue, ProgrammLevels.middle.rawValue, .systemYellow)
        case 6:
            return (ProgrammNames.six.rawValue, ProgrammLevels.middle.rawValue, .systemYellow)
        case 7:
            return (ProgrammNames.seven.rawValue, ProgrammLevels.beginner.rawValue, .systemGreen)
        case 8:
            return (ProgrammNames.eight.rawValue, ProgrammLevels.middle.rawValue, .systemYellow)
        case 9:
            return (ProgrammNames.nine.rawValue, ProgrammLevels.beginner.rawValue, .systemGreen)
        default:
            return ("", "", .darkGray)
        }
    }
    static func toFillTitles(cell: CollectionViewCell, number: Int) -> CollectionViewCell {
        cell.topTitleLabel.text = CollectionViewTitles().toSetTitlesValues(cell: number).0
        cell.bottomTitleLabel.text = CollectionViewTitles().toSetTitlesValues(cell: number).1
        cell.bottomTitleLabel.backgroundColor = CollectionViewTitles().toSetTitlesValues(cell: number).2
        cell.bottomTitleLabel.alpha = 0.6
        cell.bottomTitleLabel.layer.cornerRadius = 10
        cell.layer.cornerRadius = 10
        return cell
    }
}
