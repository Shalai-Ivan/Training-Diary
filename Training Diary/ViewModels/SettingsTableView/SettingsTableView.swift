//
//  SettingsTableView.swift
//  Training Diary
//
//  Created by user on 25.08.2022.
//

import UIKit

struct SettingsTableView {
    private var arrayMain: [String] {
        get {
            var array = [String]()
            for item in SettingsTableViewCellFields.Main.allCases {
                array.append(item.rawValue)
            }
            return array
        }
    }
    private var arrayInterface: [String] {
        get {
            var array = [String]()
            for item in SettingsTableViewCellFields.Interface.allCases {
                array.append(item.rawValue)
            }
            return array
        }
    }
    private var arrayAdditionally: [String] {
        get {
            var array = [String]()
            for item in SettingsTableViewCellFields.Additionally.allCases {
                array.append(item.rawValue)
            }
            return array
        }
    }

    static func toCountRowsInSection(section: Int) -> Int {
        switch section {
        case 0:
            return SettingsTableView().arrayMain.count
        case 1:
            return SettingsTableView().arrayInterface.count
        case 2:
            return SettingsTableView().arrayAdditionally.count
        default:
            return 0
        }
    }
    static func toSetSectionTitle(section: Int) -> String {
        switch section {
        case 0:
            return "Главное"
        case 1:
            return "Интерфейс"
        case 2:
            return "Дополнительно"
        default:
            return ""
        }
    }
    static func toFillCells(tableView: UITableView, row: Int, section: Int) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewIndentifiers.firstCellIdentifier.rawValue)
        switch section {
        case 0:
            cell?.textLabel?.text = SettingsTableView().arrayMain[row]
            cell?.textLabel?.textColor = .white
            cell?.textLabel?.numberOfLines = 0
            return cell ?? UITableViewCell()
        case 1:
            cell?.textLabel?.text = SettingsTableView().arrayInterface[row]
            cell?.textLabel?.textColor = .white
            cell?.textLabel?.numberOfLines = 0
            return cell ?? UITableViewCell()
        case 2:
            cell?.textLabel?.text = SettingsTableView().arrayAdditionally[row]
            cell?.textLabel?.textColor = .white
            cell?.textLabel?.numberOfLines = 0
            return cell ?? UITableViewCell()
        default:
            return UITableViewCell()
        }
    }
}
