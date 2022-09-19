//
//  SettingsVC.swift
//  Training Diary
//
//  Created by user on 19.08.2022.
//

import UIKit

class SettingsVC: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var settingsTableView: UITableView!
    private var viewModel: SettingsViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = SettingsViewModel()
        tableViewConfig()
    }
    private func tableViewConfig() {
        let nib = UINib(nibName: Identifiers.Headers.settingsHeader.rawValue, bundle: nil)
        settingsTableView.register(nib, forHeaderFooterViewReuseIdentifier: Identifiers.Headers.settingsHeader.rawValue)
    }
}

// MARK: - Extensions

extension SettingsVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: Identifiers.Headers.settingsHeader.rawValue) as? SettingsHeaderView
        header?.titleLabel.text = viewModel?.toSetSectionTitle(section: section)
        return header
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.section = section
        return viewModel?.numberOfRows() ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.TableViewCells.settingsCell.rawValue) as? SettingsTableViewCell
        guard let viewModel = viewModel, let tableViewCell = cell else { return UITableViewCell()}
        tableViewCell.viewModel = viewModel.cellViewModel(forIndexPath: indexPath)
        return tableViewCell
    }
}
