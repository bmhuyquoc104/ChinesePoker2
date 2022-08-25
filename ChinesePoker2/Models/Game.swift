//
//  ChinesePokerGame.swift
//  ChinesePoker2
//
//  Created by Võ Quốc Huy on 23/08/2022.
//

import Foundation

struct Game:Identifiable {
   var id = UUID()
   var players: [Player]
   var mode: String?
    var betAmount: Int?
    
    static func testGame() -> Game{
        let bot = [
            Player(playerName: "Steve",isBot: true, money: 5000, image: "avatar2"),
            Player(playerName: "Chris",  isBot: true, money: 3000, image: "avatar1"),
            Player(playerName: "David",  isBot: true, money: 2000, image: "avatar3")
        ]
        let game = Game(players: bot, mode: "Easy", betAmount: 50)
        return game
    }
}


