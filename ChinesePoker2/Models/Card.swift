//
//  Card.swift
//  ChinesePoker2
//
//  Created by Võ Quốc Huy on 22/08/2022.
//

import Foundation

enum Rank{
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King, Ace
}

enum Suit{
    case Club, Diamond, Heart,Spade
}

struct Card:Identifiable, Equatable {
    var id = UUID()
    var rank: Rank
    var suit: Suit
    var isSelected:Bool = false
    var image: String{
        get{
            return "\(suit) \(rank)"
        }
    }
    static func testData () -> [Card] {
        let cards = [
            Card(rank: .Two, suit: .Spade),
            Card(rank: .Three, suit: .Spade),
            Card(rank: .Four, suit: .Spade),
            Card(rank: .Five, suit: .Spade),
            Card(rank: .Six, suit: .Spade),
            Card(rank: .Seven, suit: .Spade),
            Card(rank: .Eight, suit: .Spade),
            Card(rank: .Nine, suit: .Heart),
            Card(rank: .Jack, suit: .Club),
            Card(rank: .King, suit: .Diamond),
            Card(rank: .Ace, suit: .Heart),
            Card(rank: .Ace, suit: .Club),
            Card(rank: .Ace, suit: .Spade)
        ]
        return cards
    }
    
}
