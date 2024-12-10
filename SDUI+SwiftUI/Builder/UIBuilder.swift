//
//  UIBuilder.swift
//  SDUI+SwiftUI
//
//  Created by Byron on 12/8/24.
//

import SwiftUI

struct UIBuilder {

    static func buildComponent(from uiComponent: UIComponent, eventPublisher: UIEventPublisher) -> some View {
        switch uiComponent.type {
        case .text:
            return AnyView(
                TextComponent(text: uiComponent.text ?? "")
                    .frame(maxWidth: .infinity, alignment: Alignment.fromString(uiComponent.alignment))
            )

        case .button:
            return AnyView(
                ButtonComponent(title: uiComponent.title ?? "", action: {
                    switch uiComponent.action {
                    case "showAlert":
                        eventPublisher.actionSubject.send(.showAlert)
                    case "navigate":
                        eventPublisher.actionSubject.send(.navigate)
                    default:
                        eventPublisher.actionSubject.send(.custom(action: uiComponent.action ?? ""))
                    }
                })
                .frame(maxWidth: .infinity, alignment: Alignment.fromString(uiComponent.alignment))
            )

        case .vstack:
            let childrenViews = (uiComponent.children ?? []).map { buildComponent(from: $0, eventPublisher: eventPublisher) }

            return AnyView(
                VStack(alignment: HorizontalAlignment.fromString(uiComponent.alignment), spacing: CGFloat(uiComponent.spacing ?? 0)) {
                    ForEach(childrenViews.indices, id: \.self) { index in
                        childrenViews[index]
                    }
                }.frame(maxWidth: .infinity, alignment: Alignment.fromString(uiComponent.alignment))
            )

        case .hstack:
            let childrenViews = (uiComponent.children ?? []).map { buildComponent(from: $0, eventPublisher: eventPublisher) }

            return AnyView(
                HStack(alignment: VerticalAlignment.fromString(uiComponent.alignment), spacing: CGFloat(uiComponent.spacing ?? 0)) {
                    ForEach(childrenViews.indices, id: \.self) { index in
                        childrenViews[index]
                    }.frame(maxWidth: .infinity, alignment: Alignment.fromString(uiComponent.alignment))
                }
            )

        case .image:
            guard let urlString = uiComponent.url, let url = URL(string: urlString) else {
                return AnyView(EmptyView())
            }

            return AnyView(
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
            )

        case .textfield:
            @State var text: String = uiComponent.text ?? ""

            return AnyView(
                TextField(uiComponent.placeholder ?? "Enter text", text: Binding(
                    get: { text },
                    set: { newValue in
                        text = newValue
                        eventPublisher.actionSubject.send(.updateField(id: uiComponent.id, value: newValue))
                    }
                ))
                .textFieldStyle(.roundedBorder)
                .padding()
                .frame(maxWidth: .infinity, alignment: Alignment.fromString(uiComponent.alignment))
            )
        }
    }
}
