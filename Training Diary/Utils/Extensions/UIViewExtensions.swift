//
//  File.swift
//  Training Diary
//
//  Created by user on 22.08.2022.
//

import UIKit

extension UIView {
    func toAnimateHiddenItems(viewElement: UIView, isHide: Bool) {
        UIView.transition(with: viewElement, duration: 0.5, options: .transitionCrossDissolve) {
            viewElement.isHidden = isHide
        }
    }
}
