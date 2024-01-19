//
//  ContentView.swift
//  ProjetSwiftUI
//
//  Created by Ahmed OMEROVIC on 1/19/24.
//

import SwiftUI

class Inventory: ObservableObject {
    @Published var loot = ["Epée", "Bouclier", "Armure"]
    
    func addItem(item: String) {
        loot.append(item)
    }
}

struct ContentView: View {
    @ObservedObject var inventory = Inventory()
    
    @State var showAddItemView = false

    var body: some View {
        NavigationStack {
            List {
                Button(action: {
                    inventory.addItem(item: "Magie de feu")
                }, label: {
                    Text("Ajouter")
                })
                ForEach(inventory.loot, id: \.self) { item in
                    Text(item)
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

