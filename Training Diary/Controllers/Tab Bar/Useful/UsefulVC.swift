//
//  AnotherVC.swift
//  Training Diary
//
//  Created by user on 19.08.2022.
//

import UIKit

class UsefulVC: UIViewController {

    @IBOutlet private weak var usefulTableView: UITableView!
    private var viewModel: UsefulViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = UsefulViewModel()
    }
}

// MARK: - Extensions

extension UsefulVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows() ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.TableViewCells.usefulCell.rawValue, for: indexPath)
        guard let viewModel = viewModel, let tableViewCell = cell as? UsefulTableViewCell else { return UITableViewCell() }
        tableViewCell.viewModel = viewModel.cellViewModel(forIndexPath: indexPath)
        return tableViewCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height / 15
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.performSegue(withIdentifier: Identifiers.Segues.toMuscle.rawValue, sender: nil)
        default:
            break
        }
    }
}
