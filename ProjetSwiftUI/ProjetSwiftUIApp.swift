//
//  ProjetSwiftUIApp.swift
//  ProjetSwiftUI
//
//  Created by Ahmed OMEROVIC on 1/19/24.
//

import SwiftUI

@main
struct ProjetSwiftUIApp: App {
    @AppStorage("isOnboardingComplete") var isOnboardingComplete: Bool = false
    
    var body: some Scene {
        WindowGroup {
            if isOnboardingComplete {
                ContentView()
            } else {
                OnboardingView(isOnboardingComplete: $isOnboardingComplete)
            }
        }
    }
}
