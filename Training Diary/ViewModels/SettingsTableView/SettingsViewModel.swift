//
//  SettingsTableView.swift
//  Training Diary
//
//  Created by user on 25.08.2022.
//

import UIKit

class SettingsViewModel {
    private var fieldsValues = [("Главное", ["Меры веса и расстояния",
                                     "Первый день недели",
                                     "Сортировка упражнений"]),
                                ("Интерфейс", ["Тема приложения",
                                     "Цветная обводка картинок упражнений",
                                     "Автоматически закрывать окно упражнений после нажатия 'Добавить'",
                                     "Пропускать пустые дни по умолчанию",
                                     "Держать экран включенным"]),
                                ("Дополнительно", ["Синхронизация с Google Fit",
                                     "Экспорт данных",
                                     "Сообщить о проблеме"])]
    var section: Int?
    func toSetSectionTitle(section: Int) -> String {
        switch section {
        case 0:
            return fieldsValues[0].0
        case 1:
            return fieldsValues[1].0
        case 2:
            return fieldsValues[2].0
        default:
            return ""
        }
    }
    private func toSetCellValues(indexPath: IndexPath) -> String {
        switch indexPath.section {
        case 0:
            return fieldsValues[0].1[indexPath.row]
        case 1:
            return fieldsValues[1].1[indexPath.row]
        case 2:
            return fieldsValues[2].1[indexPath.row]
        default:
            return ""
        }
    }
}

// MARK: - Extensions

extension SettingsViewModel: TableViewViewModelType {
    func numberOfRows() -> Int {
        switch section {
        case 0:
            return fieldsValues[0].1.count
        case 1:
            return fieldsValues[1].1.count
        case 2:
            return fieldsValues[2].1.count
        default:
            return 0
        }
    }
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType {
        let text = toSetCellValues(indexPath: indexPath)
        return SettingsViewModelCell(text: text)
    }
}
