//
//  Player.swift
//  DurakGame
//
//  Created by Дима Носко on 15.06.21.
//

import Foundation

protocol PlayerBaseCompatible {
    var hand: [Card]? { get set }
}

final class Player: PlayerBaseCompatible {
    var hand: [Card]?

    func checkIfCanTossWhenAttacking(card: Card) -> Bool {
        guard let hand = self.hand else { return false }
        for curCard in hand { if curCard.value == card.value { return true } }
        return false
    }

    func checkIfCanTossWhenTossing(table: [Card: Card]) -> Bool {
        for pair in table {
            if checkIfCanTossWhenAttacking(card: pair.key) ||
                checkIfCanTossWhenAttacking(card: pair.value)
            { return true }
        }
        return false
    }
}
