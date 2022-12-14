//
//  ListChestViewController.swift
//  Training Diary
//
//  Created by user on 30.08.2022.
//

import UIKit

class ExercisesViewController: UIViewController {
    @IBOutlet private var addingButton: UIButton!
    var viewModel: ExercisesViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if self.isMovingFromParent {
            MusclesViewModel.deleteMuscleTitle()
        }
    }
    @IBAction private func didTapCancelButton(_ sender: Any) {
        viewModel?.chosenExercises.removeAll()
        MusclesViewModel.deleteMuscleTitle()
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    @IBAction private func didTapAddButton(_ sender: Any) {
        MusclesViewModel.muscleTitle += Array(repeating: MusclesViewModel.muscleTitle.last ?? "",
                                              count: (viewModel?.chosenExercises.count ?? 1) - 1)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let identifier = segue.identifier
        if identifier == Identifiers.Segues.toMainUnwind.rawValue {
            guard let mvc = segue.destination as? MainScreenViewController, let viewModel = viewModel else { return }
            if mvc.viewModel == nil {
                mvc.viewModel = viewModel.viewModelForSelectedRow() as? MainScreenViewModel
            } else {
                mvc.viewModel?.exercises += viewModel.chosenExercises
            }
        }
    }
}

// MARK: - Extensions

extension ExercisesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  viewModel?.numberOfRows() ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.TableViewCells.exerciseCell.rawValue) as? ExercisesTableViewCell
        guard let tableViewCell = cell, let viewModel = viewModel else { return UITableViewCell() }
        tableViewCell.viewModel = viewModel.cellViewModel(forIndexPath: indexPath)
        return tableViewCell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell = tableView.cellForRow(at: indexPath)
        selectedCell?.selectedBackgroundView?.backgroundColor = .systemGreen
        guard let viewModel = viewModel else { return }
        viewModel.chosenExercises.append(viewModel.exercises[indexPath.row])
        if !viewModel.chosenExercises.isEmpty {
            UIView.animate(withDuration: 0.5) { [weak self] in
                self?.addingButton.isHidden = false
                self?.addingButton.alpha = 1
            }
        }
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let viewModel = viewModel else { return }
        if let index = viewModel.chosenExercises.firstIndex(of: viewModel.exercises[indexPath.row]) {
            viewModel.chosenExercises.remove(at: index)
        }
        if viewModel.chosenExercises.isEmpty {
            UIView.animate(withDuration: 0.5) { [weak self] in
                self?.addingButton.isHidden = true
                self?.addingButton.alpha = 0
            }
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height / 15
    }
}
