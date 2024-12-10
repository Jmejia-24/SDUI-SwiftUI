//
//  ButtonComponent.swift
//  SDUI+SwiftUI
//
//  Created by Byron on 12/8/24.
//

import SwiftUI

struct ButtonComponent: View {

    let title: String
    let action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
        }
    }
}
