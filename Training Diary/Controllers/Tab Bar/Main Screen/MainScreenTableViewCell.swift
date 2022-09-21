//
//  MainScreenTableViewCell.swift
//  Training Diary
//
//  Created by user on 02.09.2022.
//

import UIKit

class MainScreenTableViewCell: UITableViewCell {
    @IBOutlet weak var imageViewMain: UIImageView!
    @IBOutlet private weak var titleLabelMain: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    weak var viewModel: TableViewCellViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            imageViewMain.image = viewModel.image
            titleLabelMain.text = viewModel.text
        }
    }
    var deletedCell: TableViewCellSettingsType?
    var indexPath: IndexPath?
    var actionHandler: ((UIViewController) -> Void)?
    var approachNumber = 1
    @IBAction private func didTapPlusButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: Identifiers.Screens.approachScreen.rawValue, bundle: nil)
        let approachVC = storyboard.instantiateViewController(withIdentifier: Identifiers.Screens.approachScreen.rawValue) as? ApproachViewController
        approachVC?.modalPresentationStyle = .popover
        guard let approach = approachVC, let avc = approachVC?.popoverPresentationController else { return }
        avc.delegate = self
        avc.sourceView = plusButton
        avc.permittedArrowDirections = [.left, .right, .down, .up]
        avc.sourceRect = CGRect(x: 20,
                                y: 10,
                                width: 0,
                                height: 0)
        approach.preferredContentSize = CGSize(width: 250, height: 250)
        actionHandler?(approach)
    }
    @IBAction private func didTapDeleteButton(_ sender: UIButton) {
        guard let indexPath = indexPath else { return }
        deletedCell?.delete(forIndexPath: indexPath)
    }
}

extension MainScreenTableViewCell: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        .none
    }
}

extension MainScreenTableViewCell: ApproachAddingType {
    func addApproach() {
        approachNumber += 1
        let storyboard = UIStoryboard(name: Identifiers.Screens.approachContainer.rawValue, bundle: nil)
        let approachContainer = storyboard.instantiateViewController(withIdentifier: Identifiers.Screens.approachContainer.rawValue)
        guard let approach = approachContainer as? ApproachContainer else { return }
        self.addSubview(approach.view)
        approach.view.frame = plusButton.frame
        approach.view.frame.size = plusButton.frame.size
        plusButton.frame.origin.x += plusButton.frame.width
        approach.imageColor.layer.cornerRadius = approach.imageColor.frame.height / 2
    }
}
