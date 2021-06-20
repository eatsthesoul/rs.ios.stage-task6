//
//  Game.swift
//  DurakGame
//
//  Created by Дима Носко on 16.06.21.
//

import Foundation

protocol GameCompatible {
    var players: [Player] { get set }
}

struct Game: GameCompatible {
    var players: [Player]
}

extension Game {

    func defineFirstAttackingPlayer(players: [Player]) -> Player? {
        
        var firstPlayer: Player? = nil
        var smallestTrump = Value.ace
        
        players.forEach { player in
            player.hand?.forEach { card in
                if card.isTrump && card.value.rawValue <= smallestTrump.rawValue {
                    smallestTrump = card.value
                    firstPlayer = player
                }
            }
        }
        
        return firstPlayer
    }
}
