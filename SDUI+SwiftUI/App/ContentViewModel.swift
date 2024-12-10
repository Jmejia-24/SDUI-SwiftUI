//
//  ContentViewModel.swift
//  SDUI+SwiftUI
//
//  Created by Byron on 12/8/24.
//

import Foundation
import Combine

@Observable
final class ContentViewModel {

    private var apiManager = APIManager()
    private var cancellables = Set<AnyCancellable>()

    var components: [UIComponent] = []

    var showAlert = false
    var navigateToNewPage = false
    var textFieldValues: [UUID: String] = [:]

    let eventPublisher = UIEventPublisher()

    init() {
        setupBindings()
    }

    func fetchData() async {
        do {
            let response = try await apiManager.loadJSONFromFile(fileName: "SDResponse", as: [UIComponent].self)

            components = response
        } catch {
            print(error)
        }
    }
}

private extension ContentViewModel {

    func setupBindings() {
        eventPublisher.actionSubject
            .sink { [weak self] action in
                self?.handleAction(action)
            }
            .store(in: &cancellables)
    }

    func handleAction(_ action: UIAction) {
        switch action {
        case .showAlert:
            showAlert = true
        case .navigate:
            navigateToNewPage = true
        case .updateField(let id, let value):
            textFieldValues[id] = value
            print("Updated field \(id): \(value)")
        case .custom(let action):
            print("Unhandled action: \(action)")
        }
    }
}
