import SwiftUI

struct OnboardingView: View {
    @StateObject var viewModel: OnboardingModel
    @State private var currentPage: Int = 1
    
    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                OnboardingPageView(title: "En un coup d'œil", description: "Explorez une interface intuitive qui vous permet de visualiser rapidement toutes les informations importantes sur vos objets.", imageName: "eye.fill", colorCircle: Color.green, currentPage: $currentPage, viewModel: viewModel)
                    .tag(1)
                OnboardingPageView(title: "Gérer ses loots", description: "Découvrez comment organiser et gérer efficacement vos objets et équipements dans votre collection de loots.", imageName: "hammer.fill", colorCircle: Color.blue, currentPage: $currentPage, viewModel: viewModel)
                    .tag(2)
                OnboardingPageView(title: "Votre wishlist", description: "Créez et partagez votre wishlist personnalisée en ajoutant vos objets préférés et découvrez des fonctionnalités exclusives.", imageName: "star.fill", colorCircle: Color.orange, currentPage: $currentPage, viewModel: viewModel)
                    .tag(3)
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
    }
}

struct OnboardingPageView: View {
    var title: String
    var description: String
    var imageName: String
    var colorCircle: Color
    
    @Binding var currentPage: Int
    @StateObject var viewModel: OnboardingModel
    
    var body: some View {
        VStack {
            Text(title)
                .font(.largeTitle)
                .padding()
            Circle()
                .foregroundColor(colorCircle)
                .frame(width: 200, height: 200)
                .overlay(
                    Image(systemName: imageName)
                        .foregroundColor(.white)
                        .padding()
                )
            
            Text(description)
                .font(.subheadline)
                .padding()
            
            Button(action: {
                if currentPage <= 2 {
                    currentPage += 1
                } else {
                    viewModel.isOnboardingComplete = true
                }
            }) {
                if currentPage <= 2 {
                    Text("Suivant")
                } else {
                    Text("Commencer")
                }
            }
            .padding()
        }
        .padding()
    }
}
