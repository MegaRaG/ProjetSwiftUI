//
//  LootItem.swift
//  ProjetSwiftUI
//
//  Created by Ahmed OMEROVIC on 1/19/24.
//

import SwiftUI

enum ItemType: String, CaseIterable , Hashable{
    case magic = "⭐️"
    case fire = "🔥"
    case ice = "❄️"
    case wind = "💨"
    case poison = "☠️"
    case thunder = "⚡️"
    case dagger = "🗡️"
    case shield = "🛡️"
    case bow = "🏹"
    case ring = "💍"
    case unknown = "🎲"
}
extension Color {
    init(hex: Int, alpha: Double = 1.0) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255.0,
            green: Double((hex >> 8) & 0xFF) / 255.0,
            blue: Double(hex & 0xFF) / 255.0,
            opacity: alpha
        )
    }
}

enum Rarity:CaseIterable {
    case common, uncommon, rare, epic, legendary, unique
    
    func ColorRarity()->Color{
        switch self{
        case .common:
            return Color.gray
        case .uncommon:
            return Color.green
        case .rare:
            return Color.blue
        case .epic:
            return Color.purple
        case .legendary:
            return Color.red
        case .unique:
            return Color.yellow
        }
    }
    func ShadowColor() -> Color {
        switch self {
        case .common:
            return Color(hex: 0x808080) // Gris
        case .uncommon:
            return Color(hex: 0x008000) // Vert
        case .rare:
            return Color(hex: 0x0000FF) // Bleu
        case .epic:
            return Color(hex: 0x800080) // Violet
        case .legendary:
            return Color(hex: 0xFFA500) // Orange (légèrement plus foncé)
        case .unique:
            return Color(hex: 0xFFFF00) // Jaune
        }
    }
}

struct LootItem: Hashable {
    var quantity: Int = 1
    var name: String
    var type: ItemType
    var rarity: Rarity
    var attackStrength: Int?
    var game: Game
}



