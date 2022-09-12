//
//  SettingsVC.swift
//  Training Diary
//
//  Created by user on 19.08.2022.
//

import UIKit

class SettingsVC: UIViewController {

    @IBOutlet private weak var settingsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewConfig()
    }
    private func tableViewConfig() {
        let nib = UINib(nibName: Identifiers.Headers.settingsHeader.rawValue, bundle: nil)
        settingsTableView.register(nib, forHeaderFooterViewReuseIdentifier: Identifiers.Headers.settingsHeader.rawValue)
//        settingsTableView.tableFooterView = UIView()
    }
}

extension SettingsVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: Identifiers.Headers.settingsHeader.rawValue) as? SettingsHeaderView
        header?.titleLabel.text = SettingsTableView.toSetSectionTitle(section: section)
        return header
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingsTableView.toCountRowsInSection(section: section)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return SettingsTableView.toFillCells(tableView: tableView, row: indexPath.row, section: indexPath.section)
    }
}
