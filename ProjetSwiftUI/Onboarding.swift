//
//  Onboarding.swift
//  ProjetSwiftUI
//
//  Created by Ahmed OMEROVIC on 1/24/24.
//

import SwiftUI

struct OnboardingView: View {
    @Binding var isOnboardingComplete: Bool
    @State private var currentPage = 0

    var body: some View {
        TabView(selection: $currentPage) {
            OnboardingVue1(currentPage: $currentPage)
            OnboardingVue2(currentPage: $currentPage)
            OnboardingVue3(isOnboardingComplete: $isOnboardingComplete)
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

struct OnboardingVue1: View {
    @Binding var currentPage: Int
    
    var body: some View {
        VStack {
            Text("Gérer ses loots")
                .font(.largeTitle)
                .padding()

            Circle()
                .foregroundColor(Color.blue)
                .frame(width: 200, height: 200)
                .overlay(
                    Image(systemName: "hammer.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 100))
                )

            Text("Découvrez comment organiser et gérer efficacement vos objets et équipements dans votre collection de loots.")
                .font(.subheadline)
                .padding()

            Button("Suivant") {
                currentPage = 2
            }
            .padding()
        }
    }
}

struct OnboardingVue2: View {
    @Binding var currentPage: Int
    
    var body: some View {
        VStack {
            Text("En un coup d'œil")
                .font(.largeTitle)
                .padding()

            Circle()
                .foregroundColor(Color.green)
                .frame(width: 200, height: 200)
                .overlay(
                    Image(systemName: "eye.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 100))
                )

            Text("Explorez une interface intuitive qui vous permet de visualiser rapidement toutes les informations importantes sur vos objets.")
                .font(.subheadline)
                .padding()

            Button("Suivant") {
                currentPage = 3
            }
            .padding()
        }
    }
}

struct OnboardingVue3: View {
    @Binding var isOnboardingComplete: Bool
    
    var body: some View {
        VStack {
            Text("Votre wishlist")
                .font(.largeTitle)
                .padding()

            Circle()
                .foregroundColor(Color.orange)
                .frame(width: 200, height: 200)
                .overlay(
                    Image(systemName: "star.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 100))
                )

            Text("Créez et partagez votre wishlist personnalisée en ajoutant vos objets préférés et découvrez des fonctionnalités exclusives.")
                .font(.subheadline)
                .padding()

            Button("Terminer") {
                isOnboardingComplete = true
            }
            .padding()
        }
    }
}

