//
//  Identifiers.swift
//  Training Diary
//
//  Created by MacMini on 9.09.22.
//

import Foundation

enum Identifiers {
    enum Screens: String {
        case mainScreen = "MainScreen"
        case programmsScreen = "ProgrammsScreen"
        case settingsScreen = "SettingsScreen"
        case usefulScreen = "UsefulScreen"
        case muscleScreen = "MuscleScreen"
        case exerciseScreen = "ExerciseScreen"
        case cellInformationScreen = "CellInformationScreen"
        case approachScreen = "ApproachScreen"
    }
    enum Segues: String {
        case toCellInformation
        case toMuscle
        case toExercises
        case toMainUnwind
    }
    enum TableViewCells: String {
        case mainCell
        case exerciseCell
        case muscleCell
        case settingsCell
        case usefulCell
        case programmsViewCell
    }
    enum Headers: String {
        case mainHeader = "MainHeaderView"
        case settingsHeader = "SettingsHeaderView"
    }
}
