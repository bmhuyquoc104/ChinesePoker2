//
//  Player.swift
//  ChinesePoker2
//
//  Created by Võ Quốc Huy on 23/08/2022.
//

import Foundation

struct Player: Identifiable {
    var playerName: String
    var id = UUID()
    var playerCards = Stack()
    var isBot = true
    var score: Int?
    var image: String?
    static func testPlayer () -> [Player] {
        let players = [
            Player(playerName: "huy", playerCards: Card.testData(), isBot: false),
            Player(playerName: "trung", playerCards: Card.testData(), isBot: true),
            Player(playerName: "ngoc", playerCards: Card.testData(), isBot: true)
        ]
        return players
    }
}
