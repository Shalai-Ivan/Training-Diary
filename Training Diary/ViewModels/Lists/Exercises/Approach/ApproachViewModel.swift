//
//  ApproachViewModel.swift
//  Training Diary
//
//  Created by MacMini on 10.09.22.
//

import CoreData
import UIKit

class ApproachViewModel {
    private var titleChosen = -1
    var approachNumber: Int?
    var titleColor: UIColor?
    func toHighlightLabel(label: UILabel, number: Int) -> UILabel? {
        if titleChosen != number {
            titleChosen = number
            switch number {
            case 0:
                label.textColor = .white
                label.backgroundColor = .systemGreen
                return label
            case 1:
                label.textColor = .white
                label.backgroundColor = .systemYellow
                return label
            case 2:
                label.textColor = .white
                label.backgroundColor = .systemRed
                return label
            default:
                return label
            }
        } else {
            titleChosen = -1
            return label
        }
    }
    private func getContext() -> NSManagedObjectContext {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return NSManagedObjectContext() }
        return appDelegate.persistentContainer.viewContext
    }
    func saveApproach(weight: String?, count: String?, color: UIColor?) {
        let context = getContext()
        guard let entity = NSEntityDescription.entity(forEntityName: "Approach", in: context) else { return }
        let approachObject = Approach(entity: entity, insertInto: context)
        approachObject.weight = weight ?? "-"
        approachObject.count = count ?? "-"
        approachObject.color = color ?? .lightGray
    }
}
