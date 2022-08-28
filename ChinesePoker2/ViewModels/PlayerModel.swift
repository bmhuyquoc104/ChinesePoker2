//
//  ChinesePokerGameModel.swift
//  ChinesePoker2
//
//  Created by Võ Quốc Huy on 23/08/2022.
//

import Foundation

class PlayerModel:ObservableObject {
    @Published var realPlayers:[Player]
    @Published var currentPlayer:Player?
    @Published var currentIndex:Int?
    init(){
            let players = [
                Player(playerName: "Huy", isBot: false, money: 70000, image: "daredevil",achievements: [
                    Achievement(name: "Silver", description: "Earn $100", image: "Silver"),
                    Achievement(name: "Platinum", description: "Earn $500", image: "Platinum"),
                    Achievement(name: "Gold", description: "Earn $1000", image: "Gold"),
                    Achievement(name: "Diamond", description: "Earn $10000", image: "Diamond"),
                    Achievement(name: "Master", description: "Earn $50000", image: "Master"),
                    Achievement(name: "Challenger", description: "Earn $100000", image: "Challenger"),
                    Achievement(name: "", description: "1day streak", image: "1day-streak"),

                ]),
                Player(playerName: "Shangchi", isBot: false, money: 4000, image: "avatar2",achievements: [
                    Achievement(name: "Silver", description: "Earn $100", image: "Silver"),
                    Achievement(name: "Platinum", description: "Earn $500", image: "Platinum"),
                ]),
                Player(playerName: "Lee", isBot: false, money: 10050, image: "avatar2",achievements: [
                    Achievement(name: "Silver", description: "Earn $100", image: "Silver"),
                    Achievement(name: "Platinum", description: "Earn $500", image: "Platinum"),
                    Achievement(name: "Gold", description: "Earn $1000", image: "Gold"),
                ]),
                Player(playerName: "Shara", isBot: false, money: 2000, image: "avatar2",achievements: [
                    Achievement(name: "Silver", description: "Earn $100", image: "Silver"),
                    Achievement(name: "Platinum", description: "Earn $500", image: "Platinum"),
                    Achievement(name: "Gold", description: "Earn $1000", image: "Gold"),
                ]),
                Player(playerName: "Khan", isBot: false, money: 500, image: "avatar2",achievements: [
                    Achievement(name: "Silver", description: "Earn $100", image: "Silver"),
                    Achievement(name: "Platinum", description: "Earn $500", image: "Platinum"),
                    Achievement(name: "Gold", description: "Earn $1000", image: "Gold"),
                ]),
                Player(playerName: "Chris", isBot: false, money: 30000, image: "avatar2",achievements: [
                    Achievement(name: "Silver", description: "Earn $100", image: "Silver"),
                    Achievement(name: "Platinum", description: "Earn $500", image: "Platinum"),
                    Achievement(name: "Gold", description: "Earn $1000", image: "Gold"),
                ]),

                Player(playerName: "Tommy", isBot: false, money: 50000, image: "avatar3",achievements: [
                    Achievement(name: "Silver", description: "Earn $100", image: "Silver"),
                    Achievement(name: "Platinum", description: "Earn $500", image: "Platinum"),
                    Achievement(name: "Gold", description: "Earn $1000", image: "Gold"),
                ])]
                realPlayers = players
            }
    

    
    func findTopThree (){
        return realPlayers.sort(by: {
            $0.money > $1.money
        })
    }
    
    func findCurrentPlayer(id:UUID){
        currentIndex = realPlayers.firstIndex { Player in
            Player.id == id
        }
        if let index = currentIndex{
            self.currentPlayer = realPlayers[index]
        }
    }
}
