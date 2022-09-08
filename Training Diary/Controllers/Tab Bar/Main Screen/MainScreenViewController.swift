//
//  ViewController.swift
//  Training Diary
//
//  Created by user on 19.08.2022.
//

import UIKit

class MainScreenViewController: UIViewController {
    @IBOutlet private weak var currentDateTitleLabel: UILabel!
    @IBOutlet private weak var timerImageView: UIImageView!
    @IBOutlet private weak var calendarImageView: UIImageView!
    @IBOutlet private weak var listImageView: UIImageView!
    @IBOutlet private weak var fromAnotherDayButton: UIButton!
    @IBOutlet private weak var fromProgrammsButton: UIButton!
    @IBOutlet private weak var fromExerciseListButton: UIButton!
    @IBOutlet private weak var stackViewButtons: UIStackView!
    @IBOutlet private weak var stackViewTitles: UIStackView!
    @IBOutlet private weak var stackViewZzz: UIStackView!
    @IBOutlet private weak var tableView: UITableView!
    var viewModel: MainScreenViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewConfig()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        if viewModel?.exercises.isEmpty != nil {
            stackViewZzz.isHidden = true
        } else {
            stackViewZzz.isHidden = false
        }
    }

    private func tableViewConfig() {
        let nib = UINib(nibName: "MainScreenHeaderView", bundle: nil)
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: "MainScreenHeaderView")
    }
    @IBAction private func didTapAddExerciseButton(_ sender: Any) {
        if stackViewButtons.isHidden {
            UIView.animate(withDuration: 0.5) { [weak self] in
                self?.stackViewButtons.isHidden = false; self?.stackViewButtons.alpha = 1
                self?.stackViewTitles.isHidden = false; self?.stackViewTitles.alpha = 1
            }
        } else {
            UIView.animate(withDuration: 0.5) { [weak self] in
                self?.stackViewButtons.isHidden = true; self?.stackViewButtons.alpha = 0
                self?.stackViewTitles.isHidden = true; self?.stackViewTitles.alpha = 0
            }
        }
    }
    @IBAction private func didTapListOfExercisesButton(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
        stackViewButtons.isHidden = true; stackViewButtons.alpha = 0
        stackViewTitles.isHidden = true; stackViewTitles.alpha = 0
    }
    @IBAction private func didTapFromProgrammsButton(_ sender: Any) {
        self.tabBarController?.selectedIndex = 1
        stackViewButtons.isHidden = true; stackViewButtons.alpha = 0
        stackViewTitles.isHidden = true; stackViewTitles.alpha = 0
    }
    @IBAction private func didTapFromAnotherDayButton(_ sender: Any) {
    }
    @IBAction private func unwindSegueToMain(_ sender: UIStoryboardSegue) {
    }
    @IBAction func didTapSettingsCellButton(_ sender: Any) {
    }
}

extension MainScreenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MainScreenHeaderView") as? MainScreenHeaderView
        header?.titleLabel.text = viewModel?.getTitleMuscle()
        return header
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows() ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell") as? MainScreenTableViewCell
        guard let tableViewCell = cell, let viewModel = viewModel else { return UITableViewCell() }
        tableViewCell.viewModel = viewModel.cellViewModel(forIndexPath: indexPath)
        tableViewCell.delegate = self
        tableViewCell.indexPath = indexPath
        return tableViewCell
    }
}

extension MainScreenViewController: TableViewDeletingCellsType {
    func delete(forIndexPath indexPath: IndexPath) {
        self.viewModel?.exercises.remove(at: indexPath.row)
        self.tableView.deleteRows(at: [indexPath], with: .none)
        MusclesViewModel.muscleTitle.remove(at: indexPath.row)
        guard !tableView.visibleCells.isEmpty else { return stackViewZzz.isHidden = false }
        tableView.reloadData()
    }
}
