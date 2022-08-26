//
//  UsefulTableViewCell.swift
//  Training Diary
//
//  Created by user on 23.08.2022.
//

import UIKit

enum UsefulTableViewCellIdentifier: String {
    case identifier = "tableViewCell"
}

enum UsefulFieldNames: String, CaseIterable {
    case zero = "  Упражнения"
    case one = "  Статистика"
    case two = "  Калькулятор"
    case three = "  Замеры"
    case four = "  Блокнот"
}

enum UsefulFieldImages: String, CaseIterable{
    case zero = "dumbbell"
    case one = "increase"
    case two = "calculator"
    case three = "tape"
    case four = "notepad"
}
