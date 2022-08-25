//
//  ProgrammsVC.swift
//  Training Diary
//
//  Created by user on 19.08.2022.
//

import UIKit

class ProgrammsVC: UIViewController {

    @IBOutlet private weak var collectionImageView: UICollectionView!
    var images: [UIImage] {
        Array(0...9).compactMap { (UIImage(named: "item\($0)")) }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionImageView.dataSource = self
        collectionImageView.delegate = self
    }
}

extension ProgrammsVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        images.count
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard var cell = collectionImageView.dequeueReusableCell(withReuseIdentifier: ProgrammsCollectionViewImage.cellIdentifier.rawValue,
                                                                 for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
        cell.imageViewCell.image = images[indexPath.row]
        cell = CollectionViewTitles.toFillCells(cell: cell, number: indexPath.row)
        return cell
    }
}

extension ProgrammsVC: UICollectionViewDelegateFlowLayout {
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
