//
//  ForSettingsTableView.swift
//  Training Diary
//
//  Created by user on 25.08.2022.
//

import Foundation

enum SettingsTableViewIndentifiers: String {
    case firstCellIdentifier = "SettingsTableViewCell"
}

enum SettingsTableViewCellFields {
    enum Main: String, CaseIterable {
        case zero = "Меры веса и расстояния"
        case one = "Первый день недели"
        case two = "Сортировка упражнений"
    }
    enum Interface: String, CaseIterable {
        case zero = "Тема приложения"
        case one = "Цветная обводка картинок упражнений"
        case two = "Автоматически закрывать окно упражнений после нажатия 'Добавить'"
        case three = "Пропускать пустые дни по умолчанию"
        case four = "Держать экран включенным"
    }
    enum Additionally: String, CaseIterable {
        case zero = "Синхронизация с Google Fit"
        case one = "Экспорт данных"
        case two = "Сообщить о проблеме"
        case three = "Спасибо за покупку!"
    }
}

struct ExpandedModel {
    var isExxpanded: Bool
    let title: String
    let array: [String]
}
