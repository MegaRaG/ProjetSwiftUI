//
//  Game.swift
//  ProjetSwiftUI
//
//  Created by Ahmed OMEROVIC on 1/19/24.
//

import Foundation

enum GameGenre: CaseIterable{
    case mmorpg, rpg, looter, fps, tps, strategy, unset
}

struct Game: Identifiable, Hashable {
    let name: String
    let id: UUID = UUID()
    let genre: GameGenre
    let coverName : String?
    
    static var emptyGame = Game(name: "", genre: .unset, coverName: nil)
}

// Hesitez pas mettre vos propres jeux dans la liste
let availableGames = [
    Game(name: "Elden Ring", genre: .rpg, coverName: "Image"),
    Game(name: "Skyrim", genre: .rpg, coverName: "Image 1"),
    Game(name: "WoW", genre: .mmorpg, coverName: "Image 2"),
    Game(name: "CS:GO", genre: .fps, coverName: "Image 3"),
    Game(name: "Diablo IV", genre: .looter, coverName: "Image 4")
]
