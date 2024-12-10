//
//  ContentView.swift
//  SDUI+SwiftUI
//
//  Created by Byron on 12/8/24.
//

import SwiftUI

struct ContentView: View {

    @State var viewModel = ContentViewModel()

    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(viewModel.components) { component in
                    UIBuilder.buildComponent(from: component, eventPublisher: viewModel.eventPublisher)
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .task {
                await viewModel.fetchData()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Alert"), message: Text("Button clicked!"), dismissButton: .default(Text("OK")))
            }
            .navigationDestination(isPresented: $viewModel.navigateToNewPage) {
                EmptyView()
            }
        }
    }
}

#Preview {
    ContentView()
}
