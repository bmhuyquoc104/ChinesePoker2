//
//  ChinesePokerGameModel.swift
//  ChinesePoker2
//
//  Created by Võ Quốc Huy on 23/08/2022.
//

import Foundation

class PlayerModel:ObservableObject {
    @Published public var realPlayers:[Player] = [Player]()
    @Published public var currentPlayer:Player?
    @Published var currentIndex:Int?
    let savedKey = "players"
    init(){
       getDataFromUserDefault()
    }
    
    func getDataFromUserDefault(){
        if let data = UserDefaults.standard.data(forKey: savedKey) {
                if let decoded = try? JSONDecoder().decode([Player].self, from: data) {
                    realPlayers = decoded
                    return
                }
            }
        let players = [
            Player(playerName: "Huy", isBot: false, money: 70000000, image: "daredevil",achievements: [
                Achievement(name: "Silver", description: "Earn $1000", image: "Silver"),
                Achievement(name: "Platinum", description: "Earn $20000", image: "Platinum"),
                Achievement(name: "Gold", description: "Earn $50000", image: "Gold"),
                Achievement(name: "Diamond", description: "Earn $100000", image: "Diamond"),
                Achievement(name: "Master", description: "Earn $1000000", image: "Master"),
                Achievement(name: "Challenger", description: "Earn $10000000", image: "Challenger"),
                Achievement(name: "1 Day Streak", description: "1day streak", image: "1day-streak"),
                Achievement(name: "10 Days Streak", description: "10days streak", image: "10days-streak"),
                Achievement(name: "14 Days Streak", description: "14days streak", image: "14days-streak"),
                Achievement(name: "30 Days Streak", description: "30days streak", image: "30days-streak"),
                Achievement(name: "100 Days Streak", description: "100days streak", image: "100days-streak"),
                Achievement(name: "Play 5 matches", description: "Play 5 matches", image: "5matches"),
                Achievement(name: "Play 100 matches", description: "Play 100 matches", image: "100matches"),
                Achievement(name: "Play 200 matches", description: "Play 200 matches", image: "200matches"),
            ]),
            Player(playerName: "Ngoc", isBot: false, money: 24000, image: "avatar6",achievements: [
                Achievement(name: "Silver", description: "Earn $1000", image: "Silver"),
                Achievement(name: "Platinum", description: "Earn $10000", image: "Platinum"),
                Achievement(name: "1 Day Streak", description: "1day streak", image: "1day-streak"),
                Achievement(name: "Play 5 matches", description: "Play 5 matches", image: "5matches"),

            ]),
            Player(playerName: "Lee", isBot: false, money: 69200, image: "avatar4",achievements: [
                Achievement(name: "Silver", description: "Earn $1000", image: "Silver"),
                Achievement(name: "Platinum", description: "Earn $10000", image: "Platinum"),
                Achievement(name: "Gold", description: "Earn $50000", image: "Gold"),
                Achievement(name: "1 Day Streak", description: "1day streak", image: "1day-streak"),
                Achievement(name: "Play 5 matches", description: "Play 5 matches", image: "5matches"),
                Achievement(name: "Play 100 matches", description: "Play 100 matches", image: "100matches"),

            ]),
            Player(playerName: "Shara", isBot: false, money: 15000, image: "avatar8",achievements: [
                Achievement(name: "Silver", description: "Earn $1000", image: "Silver"),
                Achievement(name: "Platinum", description: "Earn $10000", image: "Platinum"),
                Achievement(name: "1 Day Streak", description: "1day streak", image: "1day-streak"),
                Achievement(name: "10 Days Streak", description: "10days streak", image: "10days-streak"),
                Achievement(name: "Play 5 matches", description: "Play 5 matches", image: "5matches"),
            ]),
            Player(playerName: "Tommy", isBot: false, money: 5250000, image: "avatar7",achievements: [
                Achievement(name: "Silver", description: "Earn $1000", image: "Silver"),
                Achievement(name: "Platinum", description: "Earn $10000", image: "Platinum"),
                Achievement(name: "Gold", description: "Earn $50000", image: "Gold"),
                Achievement(name: "Diamond", description: "Earn $100000", image: "Diamond"),
                Achievement(name: "Master", description: "Earn $1000000", image: "Master"),
                Achievement(name: "1 Day Streak", description: "1day streak", image: "1day-streak"),
                Achievement(name: "10 Days Streak", description: "10days streak", image: "10days-streak"),
                Achievement(name: "Play 5 matches", description: "Play 5 matches", image: "5matches"),
                Achievement(name: "Play 100 matches", description: "Play 100 matches", image: "100matches"),
            ]),
            Player(playerName: "Khan", isBot: false, money: 432430, image: "avatar2",achievements: [
                Achievement(name: "Silver", description: "Earn $1000", image: "Silver"),
                Achievement(name: "Platinum", description: "Earn $10000", image: "Platinum"),
                Achievement(name: "Gold", description: "Earn $50000", image: "Gold"),
                Achievement(name: "Diamond", description: "Earn $100000", image: "Diamond"),
                Achievement(name: "10 Days Streak", description: "10days streak", image: "10days-streak"),
                Achievement(name: "Play 5 matches", description: "Play 5 matches", image: "5matches"),
                Achievement(name: "Play 100 matches", description: "Play 100 matches", image: "100matches"),
            ]),

            Player(playerName: "Chris", isBot: false, money: 5000, image: "avatar5",achievements: [
                Achievement(name: "Silver", description: "Earn $1000", image: "Silver"),
                Achievement(name: "1 Day Streak", description: "1day streak", image: "1day-streak"),
            ])]
            realPlayers = players
    }
    
    func findPlayerByName(name:String){
        let playerIndex = realPlayers.firstIndex { Player in
            Player.playerName == name
        } ?? -1
        if playerIndex == -1 {
            self.currentPlayer = Player(playerName: name, money: 10000, image: "avatar4", achievements: [
                Achievement(name: "Silver", description: "Earn $1000", image: "Silver"),
                Achievement(name: "1 Day Streak", description: "1day streak", image: "1day-streak")])
            self.realPlayers.append(currentPlayer!)

        }
        else{
            self.currentPlayer = realPlayers[playerIndex]
        }        
    }
    
    func save() {
        if let encoded = try? JSONEncoder().encode(realPlayers) {
            UserDefaults.standard.set(encoded, forKey: savedKey)
        }
    }
    
    func add(player: Player) {
        realPlayers.append(player)
        save()
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
    
    func updateAchivement(){
        let money = currentPlayer?.money ?? 10000
        print(money)
        if money >= 20000 && money < 50000 {
            if ((!currentPlayer!.achievements.contains(where: { Achievement in
                Achievement.name == "Platinum"
            }))){
                currentPlayer?.achievements.append(Achievement(name: "Platinum", description: "Earn $20000", image: "Platinum"))
            }
        }
        else if money >= 50000 && money < 100000 {
            if ((!currentPlayer!.achievements.contains(where: { Achievement in
                Achievement.name == "Gold"
            }))){
                currentPlayer?.achievements.append(Achievement(name: "Diamond", description: "Earn $50000", image: "Gold"))
            }
        }
        else if money >= 100000 && money < 1000000 {
            if ((!currentPlayer!.achievements.contains(where: { Achievement in
                Achievement.name == "Diamond"
            }))){
                currentPlayer?.achievements.append(Achievement(name: "Diamond", description: "Earn $100000", image: "Diamond"))
            }
        }
        else if money >= 1000000 && money < 10000000 {
            if ((!currentPlayer!.achievements.contains(where: { Achievement in
                Achievement.name == "Master"
            }))){
                currentPlayer?.achievements.append(Achievement(name: "Master", description: "Earn $1000000", image: "Master"))
            }
        }
        else if money >= 10000000{
            if ((!currentPlayer!.achievements.contains(where: { Achievement in
                Achievement.name == "Challenger"
            }))){
                currentPlayer?.achievements.append(Achievement(name: "Challenger", description: "Earn $10000000", image: "Challenger"))
            }
        }
        let playerIndex = realPlayers.firstIndex { Player in
            Player.playerName == currentPlayer?.playerName
        }
        realPlayers.remove(at: playerIndex!)
        realPlayers.append(currentPlayer!)
    }
}
