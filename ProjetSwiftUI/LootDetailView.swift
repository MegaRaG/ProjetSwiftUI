//
//  LootDetailView.swift
//  ProjetSwiftUI
//
//  Created by Ahmed OMEROVIC on 1/19/24.
//

import SwiftUI

struct LootDetailView: View {
    var item: LootItem
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 40)
                    .fill(item.rarity.ColorRarity())
                    .frame(width: 170, height: 165)
                    .shadow(color: item.rarity.ShadowColor(), radius: 10)
                Text(item.type.rawValue)
                    .font(.system(size: 150))
            }
            ZStack {
                Text(item.name)
                    .foregroundColor(item.rarity.ColorRarity())
                    .font(.system(size: 40))
                    .bold()
            }
            if item.rarity == .unique {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(item.rarity.ColorRarity())
                        .frame(height: 40)
                    Text("Objet Unique 🏆")
                        .foregroundColor(.white)
                        .font(.headline)
                }
                .padding()
            }
            Spacer()
            List {
                HStack{
                    if let coverImage = item.game.coverName {
                        Image(coverImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50,height: 58)
                            .cornerRadius(4)
                    }else {
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
                Text("In-game : " + item.name)
                Text("Puissance (ATQ) : \(item.attackStrength ?? 0)")
                Text("Possédé(s) : \(item.quantity)")
                Text("Rareté : \(String(describing: item.rarity).capitalized)")
            }
            .navigationBarTitle(item.name)
            .navigationBarItems(trailing:
                                    Button("Retour") {
                presentationMode.wrappedValue.dismiss()
            }
            )
        }
    }
}

#Preview {
    LootDetailView(item: LootItem(name: "Epée", type: .unknown, rarity: .unique, attackStrength: 10, game: Game.emptyGame))
}
