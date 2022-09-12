//
//  ApproachViewController.swift
//  Training Diary
//
//  Created by MacMini on 9.09.22.
//

import UIKit

class ApproachViewController: UIViewController {
    @IBOutlet private weak var approachTitle: UILabel!
    @IBOutlet private weak var weightTextField: UITextField!
    @IBOutlet private weak var countTextField: UITextField!
    @IBOutlet private weak var easyTitle: UILabel!
    @IBOutlet private weak var normTitle: UILabel!
    @IBOutlet private weak var heavyTitle: UILabel!
    @IBOutlet private weak var deleteButton: UIButton!
    @IBOutlet private weak var weightStepper: UIStepper!
    @IBOutlet private weak var countStepper: UIStepper!
    private let viewModel = ApproachViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldConfigurate()
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        preferredContentSize = CGSize(width: 250, height: 250)
    }
    private func textFieldConfigurate() {
        weightTextField.delegate = self
        countTextField.delegate = self
    }
    private func unHighlightTitles() {
        easyTitle.backgroundColor = .none; easyTitle.textColor = .lightGray
        normTitle.backgroundColor = .none; normTitle.textColor = .lightGray
        heavyTitle.backgroundColor = .none; heavyTitle.textColor = .lightGray
    }
    @IBAction private func didTapWeightStepper(_ sender: UIStepper) {
        weightTextField.text = "\(weightStepper.value)"
    }
    @IBAction private func didTapCountStepper(_ sender: UIStepper) {
        countTextField.text = "\(Int(countStepper.value))"
    }
    @IBAction private func didTapCancelButton(_ sender: Any) {
        dismiss(animated: true)
    }
    @IBAction private func didTapAddingButton(_ sender: Any) {
    }
    @IBAction private func didTapDeleteButton(_ sender: Any) {
    }
    @IBAction func didTapEasyTitle(_ sender: Any) {
        unHighlightTitles()
        easyTitle = viewModel.toHighlightLabel(label: easyTitle, number: 0)
    }
    @IBAction func didTapNormTitle(_ sender: Any) {
        unHighlightTitles()
        normTitle = viewModel.toHighlightLabel(label: normTitle, number: 1)
    }
    @IBAction func didTapHeavyTitle(_ sender: Any) {
        unHighlightTitles()
        heavyTitle = viewModel.toHighlightLabel(label: heavyTitle, number: 2)
    }
}
extension ApproachViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        weightTextField.resignFirstResponder()
        countTextField.resignFirstResponder()
        return true
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet(charactersIn: "1234567890")
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
}
