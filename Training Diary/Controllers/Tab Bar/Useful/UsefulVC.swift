//
//  AnotherVC.swift
//  Training Diary
//
//  Created by user on 19.08.2022.
//

import UIKit

class UsefulVC: UIViewController {

    @IBOutlet private weak var usefulTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension UsefulVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: UsefulTableViewCellIdentifier.identifier.rawValue,
                                                 for: indexPath)
        cell = UsefulTableView.toFillCells(cell: cell, number: indexPath.row)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
