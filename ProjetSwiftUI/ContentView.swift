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
        LootItem(name: "Poison", type: .poison, rarity: .unique, attackStrength: nil, game: Game(name: "Elden Ring", genre: .rpg, coverName: "Image"))
    ]
    
    func addItem(item: LootItem) {
        loot.append(item)
    }
}

struct ContentView: View {
    @ObservedObject var inventory = Inventory()
    @State var showAddItemView = false

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Inventaire")) {
                    ForEach(inventory.loot, id: \.self) { item in
                        NavigationLink(destination: LootDetailView(item: item)) {
                            ExtractedView(item: item)
                        }
                    }
                }

                Section(header: Text("Statistiques")) {
                    Chart(inventory.loot) { set in
                        BarMark(x: .value("Année", set.name),
                                y: .value("Occurence", set.attackStrength ?? 0)
                                            )
                                        }.frame(height: 300)
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

#Preview {
    ContentView()
}



