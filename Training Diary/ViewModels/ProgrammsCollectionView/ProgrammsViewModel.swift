//
//  CollectionViewTitles.swift
//  Training Diary
//
//  Created by user on 23.08.2022.
//

import UIKit

class ProgrammsViewModel {
    private var imagesArray: [UIImage] {
        Array(0...9).compactMap { (UIImage(named: "item\($0)")) }
    }
    private let valuesArray = [("НАЧАЛЬНЫЙ", UIColor.systemGreen, "3-дневня программа для новичков"),
                               ("СРЕДНИЙ", UIColor.systemYellow, "5-дневная программа Дуга Лоренса"),
                               ("НАЧАЛЬНЫЙ", UIColor.systemGreen, "Программа с гантелями для дома"),
                               ("ПРОДВИНУТЫЙ", UIColor.systemRed, "10-недельная программа на массу"),
                               ("СРЕДНИЙ", UIColor.systemYellow, "Сила Гипертрофия Верх Низ"),
                               ("ПРОДВИНУТЫЙ", UIColor.systemRed, "Программа набора массы для эктоморфа"),
                               ("СРЕДНИЙ", UIColor.systemYellow, "Программа фулбоди на массу и силу"),
                               ("СРЕДНИЙ", UIColor.systemYellow, "Цикл упражнений для девушек"),
                               ("НАЧАЛЬНЫЙ", UIColor.systemGreen, "Программа живот: Программа тренировок для девушек"),
                               ("НАЧАЛЬНЫЙ", UIColor.systemGreen, "3-дневная Фулбоди тонизирующая тренировка для девушек")]
}

extension ProgrammsViewModel: TableViewViewModelType {
    func numberOfRows() -> Int {
        return imagesArray.count
    }
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType {
        let image = imagesArray[indexPath.row]
        let bottomText = valuesArray[indexPath.row].0
        let color = valuesArray[indexPath.row].1
        let topText = valuesArray[indexPath.row].2
        return ProgrammsViewModelCell(image: image, text: topText, bottomText: bottomText, color: color)
    }
}
