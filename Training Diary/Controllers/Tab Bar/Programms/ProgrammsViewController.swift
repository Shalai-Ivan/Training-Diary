//
//  ProgrammsVC.swift
//  Training Diary
//
//  Created by user on 19.08.2022.
//

import UIKit

class ProgrammsViewController: UIViewController {

    @IBOutlet private weak var collectionImageView: UICollectionView!
    private var viewModel = ProgrammsViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Extensions

extension ProgrammsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionImageView.dequeueReusableCell(withReuseIdentifier: Identifiers.TableViewCells.programmsViewCell.rawValue,
                                                           for: indexPath)
        guard let cell = cell as? ProgrammsCollectionViewCell else { return UICollectionViewCell() }
        cell.viewModel = viewModel.cellViewModel(forIndexPath: indexPath) as? ProgrammsViewModelCell
        cell.bottomTitleLabel.alpha = 0.6
        return cell
    }
}

extension ProgrammsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow: CGFloat = 2
        let paddingWidth = 10 * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.width - paddingWidth
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}
