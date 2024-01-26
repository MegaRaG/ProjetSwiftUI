//
//  ContentView.swift
//  ProjetSwiftUI
//
//  Created by Ahmed OMEROVIC on 1/19/24.
//

import SwiftUI

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
    @State private var selectedFeature: LooterFeature = .loot

    var body: some View {
        TabView(selection: $selectedFeature) {
            LootView()
                .tabItem {
                    Label("Loot", systemImage: "bag.fill")
                }
                .tag(LooterFeature.loot)
            WishListView()
                .tabItem {
                    Label("Wishlist", systemImage: "heart.fill")
                }
                .tag(LooterFeature.wishList)
            ProfileView()
                .tabItem {
                    Label("Profil", systemImage: "person.fill")
                }
                .tag(LooterFeature.profile)
        }
    }
}
