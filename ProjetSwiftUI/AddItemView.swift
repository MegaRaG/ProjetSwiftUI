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
    @EnvironmentObject var inventory : Inventory

    enum Rarity: String, CaseIterable {
        case common, uncommon, rare, epic, legendary, unique
    }

    var body: some View {
        Form {
            Section {
                TextField("Nom de l'objet", text: $name)
                Picker("Rareté", selection: $rarity) {
                    ForEach(Rarity.allCases, id: \.self) { rarity in
                        Text(rarity.rawValue.capitalized)
                    }
                }
            }
            Section {
                Button("Ajouter") {
                    inventory.addItem(item: name)
                    dismiss()
                }
            }
        }
    }
}


#Preview {
    AddItemView()
}

