//
//  AddItemView.swift
//  ProjetSwiftUI
//
//  Created by Ahmed OMEROVIC on 1/19/24.
//

import SwiftUI

struct AddItemView: View {
    @Environment(\.dismiss) private var dismiss
    @State var name: String = ""
    @State var rarity: Rarity = .common
    @State var quantity: Int = 1
    @State var hasAttack: Bool = false
    @State var attackStrength: Int = 0
    @State var selectedGame: Game = Game.emptyGame
    @State var type: ItemType = ItemType.unknown
    @EnvironmentObject var inventory: Inventory
    
    var body: some View {
        Form {
            Section {
                TextField("Nom de l'objet", text: $name)
                Picker("Rareté", selection: $rarity) {
                    ForEach(Rarity.allCases, id: \.self) { rarity in
                        Text(String(describing: rarity).capitalized)
                    }
                }
            }
            Section {
                Picker("Jeu", selection: $selectedGame) {
                    Text("Non spécifié")
                    ForEach(availableGames, id: \.id) { game in
                        Text(game.name)
                    }
                }
                Stepper(value: $quantity, in: 1...100) {
                    Text("Combien: \(quantity)")
                }
            }
            Section(header: Text("Types")) {
                HStack {
                    Text("Types: ")
                    Spacer()
                    Text(type.rawValue)
                }
                Picker("Type ", selection: $type) {
                    ForEach(ItemType.allCases, id: \.self) { itemType in
                        Text(itemType.rawValue)
                            .tag(itemType)
                    }
                }
                .pickerStyle(PalettePickerStyle())
            }

            
            Section {
                Toggle("Item d'attaque", isOn: $hasAttack)
                if hasAttack {
                    Stepper(value: $attackStrength, in: 1...100) {
                        Text("Force d'attaque: \(attackStrength)")
                    }
                }
            }
            Section {
                Button("Ajouter l'objet") {
                    let newItem = LootItem(
                        quantity: quantity,
                        name: name,
                        type: type,
                        rarity: rarity,
                        attackStrength: hasAttack ? attackStrength : nil,
                        game: selectedGame
                    )
                    inventory.addItem(item: newItem)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddItemView()
}

