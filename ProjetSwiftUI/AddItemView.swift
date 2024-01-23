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
    @State private var showingAlert = false
    @State private var alertMessage = ""
    
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
                    Text(Game.emptyGame.name)
                    ForEach(availableGames, id: \.self) { game in
                        Text(String(describing: game.name).capitalized)
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
                    validateFieldsAndAddItem()
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Erreur"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                }
            }
        }
    }
    
    private func validateFieldsAndAddItem() {
            // Validate all fields before adding the item
            if validateName() && validateType() && validateGame() {
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
    
    private func validateName() -> Bool {
            if name.isEmpty {
                alertMessage = "Le nom de l'objet ne doit pas être vide."
                showingAlert = true
                return false
            } else if name.count < 3 {
                alertMessage = "Le nom de l'objet doit faire au moins 3 caractères."
                showingAlert = true
                return false
            }
            return true
        }

        private func validateType() -> Bool {
            if type == .unknown {
                alertMessage = "Le type de l'objet ne peut pas être inconnu."
                showingAlert = true
                return false
            }
            return true
        }

        private func validateGame() -> Bool {
            if selectedGame == Game.emptyGame {
                alertMessage = "Le jeu ne peut pas être vide."
                showingAlert = true
                return false
            }
            return true
        }
}

#Preview {
    AddItemView()
}

