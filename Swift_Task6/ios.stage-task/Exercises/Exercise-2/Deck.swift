import Foundation

protocol DeckBaseCompatible: Codable {
    var cards: [Card] {get set}
    var type: DeckType {get}
    var total: Int {get}
    var trump: Suit? {get}
}

enum DeckType:Int, CaseIterable, Codable {
    case deck36 = 36
}

struct Deck: DeckBaseCompatible {

    //MARK: - Properties

    var cards = [Card]()
    var type: DeckType
    var trump: Suit?

    var total:Int {
        return type.rawValue
    }
}

extension Deck {

    init(with type: DeckType) {
        self.type = type
        
        switch type {
        case .deck36: cards = createDeck(suits: Suit.allCases, values: Value.allCases)
        }
    }

    public func createDeck(suits:[Suit], values:[Value]) -> [Card] {
        
        var cardsArray = [Card]()
        
        suits.forEach { suit in
            values.forEach { value in
                cardsArray.append(Card(suit: suit, value: value))
            }
        }
        
        return cardsArray
    }

    public mutating func shuffle() {
        self.cards = cards.shuffled()
    }

    public mutating func defineTrump() {
        guard let firstCard = cards.first else { return }
        self.trump = firstCard.suit
        setTrumpCards(for: firstCard.suit)
    }

    public mutating func initialCardsDealForPlayers(players: [Player]) {
        players.forEach { player in
            player.hand = []
            for _ in 0..<6 {
                guard let card = cards.popLast() else { return }
                player.hand?.append(card)
            }
        }
    }

    public mutating func setTrumpCards(for suit:Suit) {
        
        var cardsArray = [Card]()
        
        for card in cards {
            if card.suit == suit {
                cardsArray.append(Card(suit: card.suit, value: card.value, isTrump: true))
            } else {
                cardsArray.append(card)
            }
        }
        
        self.cards = cardsArray
    }
}

