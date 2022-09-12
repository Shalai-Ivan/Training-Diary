//
//  ApproachViewModel.swift
//  Training Diary
//
//  Created by MacMini on 10.09.22.
//

import UIKit

class ApproachViewModel {
    private var titleChosen = -1
    func toHighlightLabel(label: UILabel, number: Int) -> UILabel? {
        if titleChosen != number {
            titleChosen = number
            switch number {
            case 0:
                label.textColor = .white
                label.backgroundColor = .systemGreen
                return label
            case 1:
                label.textColor = .white
                label.backgroundColor = .systemYellow
                return label
            case 2:
                label.textColor = .white
                label.backgroundColor = .systemRed
                return label
            default:
                return label
            }
        } else {
            titleChosen = -1
            return label
        }
    }
}
