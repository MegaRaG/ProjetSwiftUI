//
//  ContentView.swift
//  ProjetSwiftUI
//
//  Created by Ahmed OMEROVIC on 1/19/24.
//

import SwiftUI
import Charts

class Inventory: ObservableObject {
    @Published var loot: [LootItem] = [
        LootItem(name: "Epée", type: .dagger, rarity: .common, attackStrength: 10, game: Game.emptyGame),
        LootItem(name: "Bouclier", type: .shield, rarity: .uncommon, attackStrength: 5, game: Game.emptyGame),
        LootItem(name: "Poison", type: .poison, rarity: .unique, attackStrength: nil, game: Game(name: "Elden Ring", genre: .rpg, coverName: "Image")),
        LootItem(name: "Dingue", type: .thunder, rarity: .legendary, attackStrength: nil, game: Game(name: "LoL", genre: .rpg, coverName: nil))
    ]
    
    func addItem(item: LootItem) {
        loot.append(item)
    }
}
enum LooterFeature {
    case loot
    case wishList
    case profile
}

struct ContentView: View {
    @ObservedObject var inventory = Inventory()
    //@StateObject var viewModel: OnboardingModel
    @State var showAddItemView = false
    @State private var selectedFeature: LooterFeature = .loot
    
    var body: some View {
        NavigationView {
//            TabView(selection: $selectedFeature) {
//                      LootView()
//                          .tabItem {
//                              Label("Loot", systemImage: "bag.fill")
//                          }
//                          .tag(LooterFeature.loot)
//                      WishListView()
//                          .tabItem {
//                              Label("Wishlist", systemImage: "heart.fill")
//                          }
//                          .tag(LooterFeature.wishList)
//                      ProfileView()
//                          .tabItem {
//                              Label("Profil", systemImage: "person.fill")
//                          }
//                          .tag(LooterFeature.profile)
//                  }
            List {
//                Section(header: Text("Onboarding")) {
//                    Button(action: {
//                        viewModel.isOnboardingComplete = false
//                    }){
//                        Text("Bouton Test")
//                    }
//                }
                Section(header: Text("Inventaire")) {
                    ForEach(inventory.loot, id: \.self) { item in
                        NavigationLink(destination: LootDetailView(item: item)) {
                            ExtractedView(item: item)
                        }
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
                
            }
            .sheet(isPresented: $showAddItemView) {
                AddItemView()
                    .environmentObject(inventory)
            }
            .navigationBarTitle("Loot")
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button(action: {
                        showAddItemView.toggle()
                    }) {
                        Image(systemName: "plus.circle.fill")
                    }
                }
            }
        }
    }
}



