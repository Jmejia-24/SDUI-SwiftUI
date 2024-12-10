//
//  Alignment.swift
//  SDUI+SwiftUI
//
//  Created by Byron on 12/9/24.
//

import SwiftUI

extension Alignment {

    static func fromString(_ alignment: String?) -> Alignment {
        switch alignment?.lowercased() {
        case "topleading":
            return .topLeading
        case "top":
            return .top
        case "toptrailing":
            return .topTrailing
        case "leading":
            return .leading
        case "center":
            return .center
        case "trailing":
            return .trailing
        case "bottomleading":
            return .bottomLeading
        case "bottom":
            return .bottom
        case "bottomtrailing":
            return .bottomTrailing
        default:
            return .center
        }
    }
}
