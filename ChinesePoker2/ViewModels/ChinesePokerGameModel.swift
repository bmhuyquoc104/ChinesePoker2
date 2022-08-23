//
//  ChinesePokerGameModel.swift
//  ChinesePoker2
//
//  Created by Võ Quốc Huy on 23/08/2022.
//

import Foundation

class ChinesePokerGameModel:ObservableObject {
    @Published var players:[Player]
//    init(){
//        players = Player.testPlayer()
//    }
    init(){
        let bot = [
            Player(playerName: "Steve", isBot: true, score: 5000, image: "avatar2"),
            Player(playerName: "Chris", playerCards: Card.testData(), isBot: true, score: 3000, image: "avatar2"),
            Player(playerName: "David", playerCards: Card.testData(), isBot: true, score: 2000, image: "avatar2")
        ]
        players = bot
        players.append(Player(playerName: "Huy", playerCards: Card.testData(), isBot: false, score: 70000, image: "avatar2"))
        
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
