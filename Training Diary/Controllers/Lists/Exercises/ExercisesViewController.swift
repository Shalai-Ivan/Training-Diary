//
//  ListChestViewController.swift
//  Training Diary
//
//  Created by user on 30.08.2022.
//

import UIKit

class ExercisesViewController: UIViewController {
    var viewModel: ExercisesViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ExercisesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  viewModel?.numberOfRows() ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExercisesTableViewCell") as? ExercisesTableViewCell
        guard let tableViewCell = cell, let viewModel = viewModel else { return UITableViewCell() }
        tableViewCell.viewModel = viewModel.cellViewModel(forIndexPath: indexPath)
        return tableViewCell
    }
}
