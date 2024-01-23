//
//  LootRow.swift
//  ProjetSwiftUI
//
//  Created by Ahmed OMEROVIC on 1/23/24.
//

import SwiftUI

struct ExtractedView: View {
    let item: LootItem

    var body: some View {
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
