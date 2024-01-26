//
//  LootView.swift
//  ProjetSwiftUI
//
//  Created by Ahmed OMEROVIC on 1/26/24.
//

import SwiftUI
import Charts

struct LootView: View {
    @Environment(\.editMode) private var editMode
    @StateObject var viewModel: OnboardingModel
    @ObservedObject var inventory = Inventory()
    @State var showAddItemView = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            NavigationView {
                List{
                    Section(header: Text("Onboarding")) {
                        Button(action: {
                            viewModel.isOnboardingComplete = false
                        }){
                            Text("Bouton Test")
                        }
                    }
                    Section(header: Text("Inventaire")) {
                        ForEach(inventory.loot, id: \.self) { item in
                            NavigationLink(destination: LootDetailView(item: item)) {
                                ExtractedView(item: item)
                            }
                        }.onDelete { indexSet in
                            inventory.loot.remove(atOffsets: indexSet)
                        }
                    }
                    Section(header: Text("Statistiques").textCase(nil)) {
                        VStack(alignment: .center, spacing: 10) {
                            Text("Vos armes les plus puissantes")
                                .font(.headline)
                            Chart(inventory.loot) { set in
                                BarMark(x: .value("Nom de l'objet", set.name),
                                        y: .value("Force d'attaque", set.attackStrength ?? 0)
                                )
                            }
                            .frame(height: 300)
                        }
                    }
                    Section(header: Text("Vos Jeux").textCase(nil)) {
                        ScrollView(.horizontal) {
                            HStack(spacing: 10) {
                                ForEach(inventory.loot, id: \.self) { item in
                                    HStack {
                                        if let coverImage = item.game.coverName {
                                            Image(coverImage)
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 50, height: 58)
                                                .cornerRadius(4)
                                        } else {
                                            ZStack {
                                                RoundedRectangle(cornerRadius: 4)
                                                    .fill(Color.gray)
                                                    .opacity(0.4)
                                                    .frame(width: 50, height: 58)
                                                Image(systemName: "rectangle.slash")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 30, height: 35)
                                                    .cornerRadius(4)
                                                    .foregroundColor(.black)
                                                    .opacity(0.4)
                                            }
                                        }
                                        Text(item.game.name)
                                            .padding(.leading, 8)
                                    }
                                }
                            }
                        }
                    }
                    
                }.navigationBarTitle("Loot")
                    .toolbar {
                        ToolbarItem(placement: .automatic) {
                            Button(action: {
                                showAddItemView.toggle()
                            }) {
                                Image(systemName: "plus.circle.fill")
                            }
                        }
                    }
                    .sheet(isPresented: $showAddItemView) {
                        AddItemView()
                            .environmentObject(inventory)
                            .onDisappear {
                                showAddItemView = false
                            }
                    }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}
    struct WishListView: View {
        var body: some View {
            Text("Wish list")
        }
    }
    
    struct ProfileView: View {
        var body: some View {
            Text("Profile")
        }
    }
    
