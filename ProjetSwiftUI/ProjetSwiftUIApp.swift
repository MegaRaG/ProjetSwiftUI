//
//  ProjetSwiftUIApp.swift
//  ProjetSwiftUI
//
//  Created by Ahmed OMEROVIC on 1/19/24.
//

import SwiftUI

class OnboardingModel: ObservableObject {
    @AppStorage("isOnboardingComplete") var isOnboardingComplete: Bool = false
}

@main
struct ProjetSwiftUIApp: App {
    @StateObject var viewModel = OnboardingModel()

    var body: some Scene {
        WindowGroup {
            if viewModel.isOnboardingComplete {
                ContentView(viewModel: viewModel)
            } else {
                OnboardingView(viewModel: viewModel)
            }
        }
    }
}

