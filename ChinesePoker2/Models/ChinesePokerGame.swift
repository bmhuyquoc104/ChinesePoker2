//
//  ChinesePokerGame.swift
//  ChinesePoker2
//
//  Created by Võ Quốc Huy on 23/08/2022.
//

import Foundation

struct ChinesePokerGame:Identifiable {
   var id = UUID()
   var players: [Player]
    init(){
        let bot = [
            Player(playerName: "Steve"),
            Player(playerName: "Faker"),
            Player(playerName: "Messi")
        ]
        players = bot
        players.append(Player(playerName: "huy",isBot: false))
        
        var deck = Deck()
        deck.createDeck()
        deck.deckShuffle()
        
        let randomPlayerIndex = Int(arc4random()) % players.count
        
        while deck.cardLength() > 0 {
            for player in randomPlayerIndex...randomPlayerIndex + (players.count - 1) {
                let i = player % players.count
                let card = deck.getCard()
                players[i].playerCards.append(card)
            }
        }
        
    }
}

struct Deck {
    var cards = Stack()
    mutating func createDeck(){
        for suit in Suit.allCases {
            for rank in Rank.allCases{
                cards.append(Card(rank: rank, suit: suit))
            }
        }
    }
    mutating func deckShuffle(){
        cards.shuffle()
    }
    mutating func getCard() -> Card{
        return cards.removeLast()
    }
    mutating func cardLength() -> Int {
        return cards.count
    }
}
