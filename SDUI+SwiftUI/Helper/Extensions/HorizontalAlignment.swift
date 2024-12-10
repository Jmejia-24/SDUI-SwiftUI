//
//  HorizontalAlignment.swift
//  SDUI+SwiftUI
//
//  Created by Byron on 12/8/24.
//

import SwiftUI

extension HorizontalAlignment {

    static func fromString(_ alignment: String?) -> HorizontalAlignment {
        switch alignment?.lowercased() {
        case "leading":
            return .leading
        case "trailing":
            return .trailing
        default:
            return .center
        }
    }
}
