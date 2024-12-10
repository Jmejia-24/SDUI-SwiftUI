//
//  File.swift
//  SDUI+SwiftUI
//
//  Created by Byron on 12/8/24.
//

import SwiftUI

extension VerticalAlignment {

    static func fromString(_ alignment: String?) -> VerticalAlignment {
        switch alignment?.lowercased() {
        case "top":
            return .top
        case "bottom":
            return .bottom
        default:
            return .center
        }
    }
}
