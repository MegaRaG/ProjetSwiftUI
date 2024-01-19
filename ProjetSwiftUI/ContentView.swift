//
//  ContentView.swift
//  ProjetSwiftUI
//
//  Created by Ahmed OMEROVIC on 1/19/24.
//

import SwiftUI

class Inventory: ObservableObject {
    @Published var loot: [LootItem] = [
        LootItem(name: "Epée", type: .unknown, rarity: .common, attackStrength: 10, game: Game.emptyGame),
        LootItem(name: "Bouclier", type: .shield, rarity: .uncommon, attackStrength: 5, game: Game.emptyGame),
        LootItem(name: "Armure", type: .unknown, rarity: .rare, attackStrength: nil, game: Game(name: "Elden Ring", genre: .rpg, coverName: "Image"))
    ]
    
    func addItem(item: LootItem) {
        loot.append(item)
    }
}

struct ContentView: View {
    @ObservedObject var inventory = Inventory()
    
    @State var showAddItemView = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(inventory.loot, id: \.self) { item in
                    NavigationLink {
                            LootDetailView(item: item) // On passe directement l'item à la vue
                        } label: {
                            VStack(alignment: .leading, spacing: 5) {
                                HStack {
                                    Circle()
                                        .fill(item.rarity.ColorRarity())
                                        .frame(width: 15, height: 15)
                                    Text(item.name)
                                    Text(item.type.rawValue)
                                        .foregroundColor(.gray)
                                        .padding(.trailing, 19)
                                    Spacer()
                                }
                                Text("Quantité: \(item.quantity)")
                                    .foregroundColor(.gray)
                            }
                        }
                }
            }

            .sheet(isPresented: $showAddItemView, content: {
                    AddItemView()
                    .environmentObject(inventory)
                })
            .navigationBarTitle("Loot") // Notre titre de page, choisissez le titre que vous voulez
                .toolbar(content: { // La barre d'outil de notre page
                    ToolbarItem(placement: ToolbarItemPlacement.automatic) {
                        Button(action: {
                            showAddItemView.toggle() // L'action de notre bouton
                        }, label: {
                            Image(systemName: "plus.circle.fill")
                        })
                    }
                })
        }
    }
}

#Preview {
    ContentView()
}

