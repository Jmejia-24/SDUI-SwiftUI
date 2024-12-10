//
//  UIAction.swift
//  SDUI+SwiftUI
//
//  Created by Byron on 12/9/24.
//

import Foundation

enum UIAction {

    case showAlert
    case navigate
    case updateField(id: UUID, value: String)
    case custom(action: String)
}
