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
    @IBOutlet private weak var plusButton: UIButton!
    var viewModel: MainScreenViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewConfig()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        guard let viewModel = viewModel else { return }
        stackViewZzz.isHidden = !viewModel.exercises.isEmpty
    }
    private func tableViewConfig() {
        let nib = UINib(nibName: Identifiers.Headers.mainHeader.rawValue, bundle: nil)
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: Identifiers.Headers.mainHeader.rawValue)
    }
    @objc private func tapImage() {
        self.performSegue(withIdentifier: Identifiers.Segues.toCellInformation.rawValue, sender: nil)
    }
    private func addApproach() {
        let storyboard = UIStoryboard(name: "ApproachContainer", bundle: nil)
        if let viewController = storyboard.instantiateViewController(withIdentifier: "ApproachContainer") as? ApproachContainer {
            addChild(viewController)
            view.addSubview(viewController.view)
        }
    }
// MARK: - IBActions
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
}

// MARK: - Extensions UITableView

extension MainScreenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: Identifiers.Headers.mainHeader.rawValue) as? MainHeaderView
        header?.titleLabel.text = viewModel?.getTitleMuscle()
        return header
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows() ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.TableViewCells.mainCell.rawValue) as? MainScreenTableViewCell
        guard let tableViewCell = cell, let viewModel = viewModel else { return UITableViewCell() }
        tableViewCell.viewModel = viewModel.cellViewModel(forIndexPath: indexPath)
        tableViewCell.deletedCell = self
        tableViewCell.indexPath = indexPath
        tableViewCell.actionHandler = { [weak self] viewController in
            if let avc = viewController as? ApproachViewController {
                avc.viewModel.approachNumber += 1
                avc.cell = tableViewCell
                self?.present(avc, animated: true)
            }
        }
        addImageTapRecognizer(image: tableViewCell.imageViewMain)
        return tableViewCell
    }
}

extension MainScreenViewController: TableViewCellSettingsType {
    func delete(forIndexPath indexPath: IndexPath) {
        self.viewModel?.exercises.remove(at: indexPath.row)
        self.tableView.deleteRows(at: [indexPath], with: .fade)
        MusclesViewModel.muscleTitle.remove(at: indexPath.row)
        stackViewZzz.isHidden = !tableView.visibleCells.isEmpty
        tableView.reloadData()
    }
    func addImageTapRecognizer(image: UIImageView) {
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(tapImage))
        image.addGestureRecognizer(recognizer)
        image.isUserInteractionEnabled = true
        image.backgroundColor = .init(white: 1, alpha: 1)
        image.layer.cornerRadius = 10
    }
}
