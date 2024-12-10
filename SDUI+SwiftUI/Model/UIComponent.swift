//
//  UIComponent.swift
//  SDUI+SwiftUI
//
//  Created by Byron on 12/8/24.
//

import Foundation

struct UIComponent: Codable, Identifiable {

    let id = UUID()

    let type: ComponentType
    let alignment: String?
    let spacing: Int?
    let text: String?
    let title: String?
    let action: String?
    let url: String?
    let placeholder: String?
    let children: [UIComponent]?

    enum CodingKeys: String, CodingKey {
        case type
        case alignment
        case spacing
        case text
        case title
        case action
        case url
        case placeholder
        case children
    }
}

extension UIComponent: Hashable {

    static func == (lhs: UIComponent, rhs: UIComponent) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
