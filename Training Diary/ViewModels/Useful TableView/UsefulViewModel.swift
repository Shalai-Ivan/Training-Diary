//
//  UsefulTableView.swift
//  Training Diary
//
//  Created by user on 23.08.2022.
//

import UIKit

class UsefulViewModel {
    private var arrayFieldName = [Muscle(image: UIImage(named: "dumbbell")!, text: "  Упражнения"),
                                  Muscle(image: UIImage(named: "increase")!, text: "  Статистика"),
                                  Muscle(image: UIImage(named: "calculator")!, text: "  Калькулятор"),
                                  Muscle(image: UIImage(named: "tape")!, text: "  Замеры"),
                                  Muscle(image: UIImage(named: "notepad")!, text: "  Блокнот")]
}

extension UsefulViewModel: TableViewViewModelType {
    func numberOfRows() -> Int {
        return arrayFieldName.count
    }
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType {
        let field = arrayFieldName[indexPath.row]
        return UsefulViewModelCell(field: field)
    }
}
