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
    @IBOutlet private weak var fromAnotherDayTitleLabel: UILabel!
    @IBOutlet private weak var fromProgrammsTitleLabel: UILabel!
    @IBOutlet private weak var fromExerciseListTitleLabel: UILabel!
    @IBOutlet private weak var fromAnotherDayButton: UIButton!
    @IBOutlet private weak var fromProgrammsButton: UIButton!
    @IBOutlet private weak var fromExerciseListButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction private func didTapAddExerciseButton(_ sender: Any) {
        if fromExerciseListButton.isHidden {
            view.toAnimateHiddenItems(viewElement: fromExerciseListButton, isHide: false)
            view.toAnimateHiddenItems(viewElement: fromExerciseListTitleLabel, isHide: false)
            view.toAnimateHiddenItems(viewElement: fromProgrammsTitleLabel, isHide: false)
            view.toAnimateHiddenItems(viewElement: fromProgrammsButton, isHide: false)
            view.toAnimateHiddenItems(viewElement: fromAnotherDayTitleLabel, isHide: false)
            view.toAnimateHiddenItems(viewElement: fromAnotherDayButton, isHide: false)
        } else {
            view.toAnimateHiddenItems(viewElement: fromExerciseListButton, isHide: true)
            view.toAnimateHiddenItems(viewElement: fromExerciseListTitleLabel, isHide: true)
            view.toAnimateHiddenItems(viewElement: fromProgrammsTitleLabel, isHide: true)
            view.toAnimateHiddenItems(viewElement: fromProgrammsButton, isHide: true)
            view.toAnimateHiddenItems(viewElement: fromAnotherDayTitleLabel, isHide: true)
            view.toAnimateHiddenItems(viewElement: fromAnotherDayButton, isHide: true)
        }
    }
    @IBAction private func didTapListOfExercisesButton(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    @IBAction private func didTapFromProgrammsButton(_ sender: Any) {
    }
    @IBAction private func didTapFromAnotherDayButton(_ sender: Any) {
    }
    @IBAction func unwindSegueBack(_ sender: UIStoryboardSegue) {
    }
}
