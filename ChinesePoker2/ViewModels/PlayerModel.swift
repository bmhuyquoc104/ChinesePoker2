//
//  ChinesePokerGameModel.swift
//  ChinesePoker2
//
//  Created by Võ Quốc Huy on 23/08/2022.
//

import Foundation

class PlayerModel:ObservableObject {
//    @Published var players:[Player]
//    @Published var playerBot1: Player?
//    @Published var playerBot2:Player?
//    @Published var playerBot3:Player?
//    @Published var myPlayer:Player?
    @Published var realPlayers:[Player]
    @Published var currentPlayer:Player?
    @Published var currentIndex:Int?
    init(){
//        let bot = [
//            Player(playerName: "Steve",isBot: true, money: 5000, image: "avatar2"),
//            Player(playerName: "Chris",  isBot: true, money: 3000, image: "avatar1"),
//            Player(playerName: "David",  isBot: true, money: 2000, image: "avatar3"),
//
//        ]
//        players = bot
//        players.append(Player(playerName: "Huy", isBot: false, money: 70000, image: "daredevil",achievements: ["Bronze"]))
//
//
//
//        var deck = Deck()
//        deck.createDeck()
//        deck.deckShuffle()
//
//        let randomPlayerIndex = Int(arc4random()) % players.count
//
//        while deck.cardLength() > 0 {
//            for player in randomPlayerIndex...randomPlayerIndex + (players.count - 1) {
//                let i = player % players.count
//                let card = deck.getCard()
//                players[i].playerCards.append(card)
//            }
//        }
//        playerBot1 = players[0]
//        playerBot2 = players[1]
//        playerBot3 = players[2]
//        myPlayer = players[3]
        
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
    
//    func arrangeDeck(stack:Stack) ->Stack {
//        var isPair = false
//        var isTwoPair = false
//        var isThreeOfAKind = false
//        var isStraight = false
//        var isFlush = false
//        var isFullHouse = false
//        var isFourOfAKind = false
//        var isStraightFlush = false
//        var isRoyalFlush = false
//        var rankCount = [Rank:Int]()
//        var suitCount = [Suit:Int]()
//        var playerCardsByRank = stack.sortByRank()
//        for card in playerCardsByRank {
//            if rankCount[card.rank] != nil {
//                rankCount[card.rank]! += 1
//            }
//            else{
//                rankCount[card.rank] = 1
//            }
//            if suitCount[card.suit] != nil {
//                suitCount[card.suit]! += 1
//            }
//            else {
//                suitCount[card.suit] = 1
//            }
//        }
//
//        let soretedRankCount = rankCount.sorted {
//            if $0.value != $1.value {
//                return $0.value > $1.value
//            }
//            else {
//                return $0.key.rawValue > $1.key.rawValue
//            }
//        }
//
//        let sortedByKeyRank = rankCount.sorted { $0.key.rawValue > $1.key.rawValue }
//
//
//        let sortedSuitCount = suitCount.sorted { $0.1 > $1.1 }
//        var cardRankCount = 1
//        var cardRankCount2 = 1
//
//        var possibleHands = Stack()
//
//        for rank in Rank.allCases{
//            var thisRankCount = 0
//            if (rankCount[rank] != nil){
//                thisRankCount = rankCount[rank]!
//            }
//            else{
//                continue
//            }
//
//
//            if thisRankCount > cardRankCount{
//                if cardRankCount != 1{
//                    cardRankCount2 = cardRankCount
//                }
//                cardRankCount = thisRankCount
//            }
//            else if thisRankCount > cardRankCount2{
//                cardRankCount2 = thisRankCount
//            }
//            isPair = cardRankCount > 1
//            isTwoPair = cardRankCount > 1 && cardRankCount2 > 1
//            isThreeOfAKind = cardRankCount > 2
//            isFourOfAKind = cardRankCount > 3
//            isFullHouse = cardRankCount > 2 && cardRankCount2 > 1
//
//            if isStraight {
//                continue
//            }
//            else{
//                isStraight = true
//            }
//            for i in 0...4{
//                var rankRawValue = 1
//                if rank <= Rank.Ten{
//                    rankRawValue = rank.rawValue + i
//                }
//                else if rank == Rank.Ace {
//                    rankRawValue = (rank.rawValue + i) % 13
//                    if rankRawValue == 0{
//                        rankRawValue = 13
//                    }
//                }
//                if rankCount[Rank(rawValue: rankRawValue)!] != nil {
//                    isStraight = isStraight && rankCount[Rank(rawValue: rankRawValue)!]! > 0
//                }
//                else {
//                    isStraight = false
//                }
//            }
//            for suit in Suit.allCases{
//                var thisSuitCount = 0
//                if suitCount[suit] != nil {
//                    thisSuitCount = suitCount[suit]!
//                }
//                isFlush = thisSuitCount > 5
//            }
//            if (isStraight && isFlush){
//                isStraightFlush = true
//            }
//        }
//
////        if (isStraightFlush){
////            continue
////        }
//
//        if isFourOfAKind {
//            for card in playerCardsByRank{
//                if card.rank == soretedRankCount[0].key{
//                    possibleHands.append(card)
//                }
//                if possibleHands.count < 5 {
//                    if card.rank == soretedRankCount[soretedRankCount.count - 1].key{
//                        possibleHands.append(card)
//                    }
//                }
//                else{
//                    break
//                }
//            }
//        }
//
//        else if isFullHouse{
////            let firstIndex = soretedRankCount.firstIndex( where: {$0.value == 2})
//                for card in playerCardsByRank{
//                    if possibleHands.count < 5 {
//                        if card.rank == soretedRankCount[0].key || card.rank == soretedRankCount[1].key{
//                            possibleHands.append(card)
//                        }
//                    }
//                    else{
//                        break
//                    }
//                }
//        }
//
//        else if isFlush{
//            for card in playerCardsByRank {
//                if possibleHands.count < 5 {
//                    if card.suit == sortedSuitCount[0].key{
//                        possibleHands.append(card)
//                    }
//                }
//                else{
//                    break
//                }
//            }
//        }
//
////        else if isStraight{
////            var count = 0
////            var tempArr = [Rank:Int]()
////            for i in 0..<sortedByKeyRank.count - 1{
////                let current = sortedByKeyRank[i].key.rawValue
////                let next = sortedByKeyRank[i+1].key.rawValue
////                let temp = current - next
////                if temp == 1 {
////                    count += 1
////                }
////                else if temp == 0 {
////                    continue
////                }
////                else {
////                    count = 0
////                }
////                if count == 5{
////                    for card in playerCardsByRank{
////                        if card.rank == sortedByKeyRank[i].key ||
////                            card.rank == sortedByKeyRank[i-1].key ||
////                            card.rank == sortedByKeyRank[i-2].key ||
////                            card.rank == sortedByKeyRank[i-3].key ||
////                            card.rank == sortedByKeyRank[i-4].key {
////                            possibleHands.append(card)
////                        }
////                    }
////                    break
////                }
////            }
////            if count < 5 {
////                for card in playerCardsByRank{
////                    if card.rank == sortedByKeyRank[0].key ||
////                        card.rank == sortedByKeyRank[soretedRankCount.count-1].key ||
////                        card.rank == sortedByKeyRank[soretedRankCount.count-2].key ||
////                        card.rank == sortedByKeyRank[soretedRankCount.count-3].key ||
////                        card.rank == sortedByKeyRank[soretedRankCount.count-4].key {
////                        possibleHands.append(card)
////                    }
////                }
////            }
////            if possibleHands.count > 5{
////                for i in 0..<possibleHands.count - 1 {
////                    let currentIndex = possibleHands[i].rank.rawValue
////                    let nextIndex = possibleHands[i+1].rank.rawValue
////                    if (currentIndex == nextIndex){
////                        possibleHands.remove(at: i)
////                        if (possibleHands.count == 5){
////                            break
////                        }
////                    }
////                }
////            }
////        }
//
//        else if isThreeOfAKind{
//            if (playerCardsByRank.count != 3) {
//                for card in playerCardsByRank{
//                    if card.rank == soretedRankCount[0].key{
//                        possibleHands.append(card)
//                    }
//                    if possibleHands.count<5 {
//                        if card.rank == soretedRankCount[soretedRankCount.count-1].key || card.rank == soretedRankCount[soretedRankCount.count-2].key{
//                            possibleHands.append(card)
//                        }
//                    }
//                    else{
//                        break
//                    }
//                }
//            }
//            else{
//                for card in playerCardsByRank{
//                    if card.rank == soretedRankCount[0].key{
//                        possibleHands.append(card)
//                    }
//                }
//            }
//
//        }
//        else if isTwoPair{
//            for card in playerCardsByRank{
//                if card.rank == soretedRankCount[0].key || card.rank == soretedRankCount[1].key{
//                    possibleHands.append(card)
//                }
//                if possibleHands.count < 5 {
//                    if card.rank == soretedRankCount[soretedRankCount.count-1].key{
//                        possibleHands.append(card)
//                    }
//                }
//                else{
//                    break
//                }
//            }
//        }
//        else if isPair {
//            if playerCardsByRank.count != 3 {
//                for card in playerCardsByRank{
//                    if card.rank == soretedRankCount[0].key{
//                        possibleHands.append(card)
//                    }
//                    if possibleHands.count < 5{
//                        if card.rank == soretedRankCount[soretedRankCount.count-1].key ||
//                            card.rank == soretedRankCount[soretedRankCount.count-2].key ||
//                            card.rank == soretedRankCount[soretedRankCount.count-3].key{
//                            possibleHands.append(card)
//                        }
//                    }
//                    else{
//                        break
//                    }
//                }
//            }
//            else{
//                for card in playerCardsByRank{
//                    if card.rank == soretedRankCount[0].key{
//                        possibleHands.append(card)
//                    }
//                    if card.rank == soretedRankCount[soretedRankCount.count-1].key{
//                        possibleHands.append(card)
//                    }
//                }
//            }
//        }
//        else {
//            if playerCardsByRank.count != 3 {
//                for card in playerCardsByRank{
//                    if  card.rank == soretedRankCount[0].key ||
//                        card.rank == soretedRankCount[1].key ||
//                        card.rank == soretedRankCount[2].key ||
//                        card.rank == soretedRankCount[3].key ||
//                        card.rank == soretedRankCount[4].key{
//                        possibleHands.append(card)
//                    }
//                }
//            }
//            else{
//                for card in playerCardsByRank{
//                    if  card.rank == soretedRankCount[0].key ||
//                        card.rank == soretedRankCount[1].key ||
//                        card.rank == soretedRankCount[2].key{
//                        possibleHands.append(card)
//                    }
//                }
//            }
//
//        }
//        var botHand = Stack()
//        botHand = possibleHands
//        return botHand
//    }
//
//
//    func botLogic(player:Player) -> Stack {
//        var playerCardsByRank = player.playerCards
//        let backHand = arrangeDeck(stack: playerCardsByRank)
//
//        playerCardsByRank.removeAll(where: { backHand.contains($0) })
//        let middleHand = arrangeDeck(stack: playerCardsByRank)
//        playerCardsByRank.removeAll(where: { middleHand.contains($0) })
//        let frontHand = arrangeDeck(stack: playerCardsByRank)
//        let model = CardModel()
//        let backHandValue = "\(model.evaluateHand(cards: backHand))"
//        let middleHandValue = "\(model.evaluateHand(cards: middleHand))"
//        let frontHandValue = "\(model.evaluateHand(cards: frontHand))"
//        var botHand = Stack()
//        botHand = [frontHand[0],frontHand[1],frontHand[2],middleHand[0],middleHand[1],middleHand[2],middleHand[3],middleHand[4],backHand[0],backHand[1],backHand[2],backHand[3],backHand[4]]
////        var middleHand = Stack()
//
//
////        botHand = possibleHands
//        return botHand
//    }
//
//    func compareHand(bot1:Stack,bot2:Stack,bot3:Stack,player:Stack,type:String){
//
//        let model = CardModel()
//        let bot1Value = model.evaluateHand(cards: bot1).rawValue
//        let bot2Value = model.evaluateHand(cards: bot2).rawValue
//        let bot3Value = model.evaluateHand(cards: bot3).rawValue
//        let playerValue = model.evaluateHand(cards: player).rawValue
//
//        print("player value: \(playerValue)")
//        print("bot1Value: \(bot1Value)")
//        print("bot2Value: \(bot2Value)")
//        print("bot3Value: \(bot3Value)")
//
//
//        let soretedBot1 = bot1.sorted {
//            return $0.rank.rawValue > $1.rank.rawValue
//        }
//
//        let soretedBot2 = bot1.sorted {
//            return $0.rank.rawValue > $1.rank.rawValue
//        }
//
//        let soretedBot3 = bot1.sorted {
//            return $0.rank.rawValue > $1.rank.rawValue
//        }
//
//        let scoreBot1 = calculateScore(stack:bot1,value:bot1Value)
//        let scoreBot2 = calculateScore(stack:bot2,value:bot2Value)
//        let scoreBot3 = calculateScore(stack:bot3,value:bot3Value)
//        let playerScore = calculateScore(stack: player, value: playerValue)
//
//        let frontHand1 = Hand(stack: bot1, frontHandScore: scoreBot1,evaluatedScore:bot1Value,name:"bot1")
//        let frontHand2 = Hand(stack: bot2, frontHandScore: scoreBot2,evaluatedScore: bot2Value,name:"bot2")
//        let frontHand3 = Hand(stack: bot3, frontHandScore: scoreBot3,evaluatedScore: bot3Value,name:"bot3")
//        let playerFrontHand = Hand(stack: player, frontHandScore: playerScore,evaluatedScore: playerValue,name:"player")
//
//
//        let handArr:[Hand] = [frontHand1,frontHand2,frontHand3,playerFrontHand].sorted{
//            if ($0.evaluatedScore != $1.evaluatedScore){
//                return $0.evaluatedScore > $1.evaluatedScore
//            }
//            return $0.frontHandScore > $1.frontHandScore
//        }
//
//        rankDeck(hand: handArr[0], type: type, value: 2)
//        rankDeck(hand: handArr[1], type: type, value: 1)
//        rankDeck(hand: handArr[2], type: type, value: -1)
//        rankDeck(hand: handArr[3], type: type, value: -2)
//
////        print(handArr[0].stack)
////        print(handArr[1].stack)
////        print(handArr[2].stack)
////        print(handArr[3].stack)
//
//    }
//
//
//
//    func calculateScore (stack:Stack,value:Int) -> Int{
//        var score = 0
//        var reward = 0
//        let soretedStack = stack.sorted {
//            return $0.rank.rawValue > $1.rank.rawValue
//        }
//        let sortedStackByRankAndOccurence = SortDeck.sortByRankAndOccurence(stack: stack)
//
//        switch value {
//        case 1:
//            reward = 1
//        case 2 :
//            reward = 10
//        case 3 :
//            reward = 100
//        case 4:
//            reward = 400
//        case 5:
//            reward = 600
//        case 6:
//            reward = 800
//        case 7:
//            reward = 1000
//        case 8:
//            reward = 1200
//        case 9:
//            reward = 1400
//        case 10:
//            reward = 1600
//        default:
//            score = 0
//        }
//
//        if (value == 1) {
//            for i in 0..<soretedStack.count - 1{
//                let current = soretedStack[i].rank.rawValue
//                let next = soretedStack[i+1].rank.rawValue
//                let temp = current - next
//                if (temp == 1) {
//                    var tempScore = 0
//                    switch soretedStack[i].rank.rawValue{
//                    case 1:
//                        tempScore = 2
//                        score += tempScore + 20
//                    case 2:
//                        tempScore = 3
//                        score += tempScore + 20
//                    case 3:
//                      tempScore = 4
//                        score += tempScore + 20
//                    case 4:
//                        tempScore = 70
//                        score += tempScore + 20
//                    case 5:
//                        tempScore = 140
//                        score += tempScore + 20
//                    case 6:
//                        tempScore = 280
//                        score += tempScore + 20
//                    case 7:
//                        tempScore = 560
//                        score += tempScore + 20
//                    case 8:
//                        tempScore = 1050
//                        score += tempScore + 20
//                    case 9:
//                        tempScore = 1960
//                        score += tempScore + 20
//                    case 10:
//                        tempScore  = 3640
//                        score += tempScore + 20
//                    case 11:
//                        tempScore = 6720
//                        score += tempScore + 20
//                    case 12:
//                        tempScore = 12390
//                        score += tempScore + 20
//                    case 13:
//                        tempScore = 22820
//                        score += tempScore + 20
//                    default:
//                        tempScore = 0
//                    }
//
//                }
//                else {
//                    var tempScore = 0
//                    switch soretedStack[i].rank.rawValue{
//                    case 1:
//                        tempScore = 2
//                        score += tempScore
//                    case 2:
//                        tempScore = 3
//                        score += tempScore
//                    case 3:
//                      tempScore = 4
//                        score += tempScore
//                    case 4:
//                        tempScore = 70
//                        score += tempScore
//                    case 5:
//                        tempScore = 140
//                        score += tempScore
//                    case 6:
//                        tempScore = 280
//                        score += tempScore
//                    case 7:
//                        tempScore = 560
//                        score += tempScore
//                    case 8:
//                        tempScore = 1050
//                        score += tempScore
//                    case 9:
//                        tempScore = 1960
//                        score += tempScore
//                    case 10:
//                        tempScore  = 3640
//                        score += tempScore
//                    case 11:
//                        tempScore = 6720
//                        score += tempScore
//                    case 12:
//                        tempScore = 12390
//                        score += tempScore
//                    case 13:
//                        tempScore = 22820
//                        score += tempScore
//                    default:
//                        tempScore = 0
//                    }
//                }
//            }
//
//        }
//        else if value == 2{
//            if (soretedStack.count == 3){
//                score += soretedStack[0].rank.rawValue * 20 + soretedStack[1].rank.rawValue * 20 + soretedStack[2].rank.rawValue
//            }
//            else{
//                score += soretedStack[0].rank.rawValue * 20 + soretedStack[1].rank.rawValue * 10 + soretedStack[2].rank.rawValue
//                + soretedStack[3].rank.rawValue + soretedStack[4].rank.rawValue
//            }
//        }
//        else if value == 4{
//            if (soretedStack.count == 3){
//                score += soretedStack[0].rank.rawValue * 100 + soretedStack[1].rank.rawValue * 100 + soretedStack[2].rank.rawValue * 100  + soretedStack[3].rank.rawValue + soretedStack[4].rank.rawValue
//            }
//            else{
//                score += soretedStack[0].rank.rawValue * 100 + soretedStack[1].rank.rawValue * 100 + soretedStack[2].rank.rawValue * 100 + soretedStack[3].rank.rawValue + soretedStack[4].rank.rawValue
//            }
//
//        }
//        else if value == 3{
//            for i in 0..<sortedStackByRankAndOccurence.count - 1{
//                let first = sortedStackByRankAndOccurence[0].key.rawValue
//                let second = sortedStackByRankAndOccurence[2].key.rawValue
//                let temp = second - first
//                if (temp == 1) {
//                    var tempScore = 0
//                    switch sortedStackByRankAndOccurence[i].key.rawValue{
//                    case 1:
//                        tempScore = 2
//                        score += tempScore + 20
//                    case 2:
//                        tempScore = 3
//                        score += tempScore + 20
//                    case 3:
//                      tempScore = 4
//                        score += tempScore + 20
//                    case 4:
//                        tempScore = 70
//                        score += tempScore + 20
//                    case 5:
//                        tempScore = 140
//                        score += tempScore + 20
//                    case 6:
//                        tempScore = 280
//                        score += tempScore + 20
//                    case 7:
//                        tempScore = 560
//                        score += tempScore + 20
//                    case 8:
//                        tempScore = 1050
//                        score += tempScore + 20
//                    case 9:
//                        tempScore = 1960
//                        score += tempScore + 20
//                    case 10:
//                        tempScore  = 3640
//                        score += tempScore + 20
//                    case 11:
//                        tempScore = 6720
//                        score += tempScore + 20
//                    case 12:
//                        tempScore = 12390
//                        score += tempScore + 20
//                    case 13:
//                        tempScore = 22820
//                        score += tempScore + 20
//                    default:
//                        tempScore = 0
//                    }
//
//                }
//                else {
//                    var tempScore = 0
//                    switch sortedStackByRankAndOccurence[i].key.rawValue{
//                    case 1:
//                        tempScore = 2
//                        score += tempScore
//                    case 2:
//                        tempScore = 3
//                        score += tempScore
//                    case 3:
//                      tempScore = 4
//                        score += tempScore
//                    case 4:
//                        tempScore = 70
//                        score += tempScore
//                    case 5:
//                        tempScore = 140
//                        score += tempScore
//                    case 6:
//                        tempScore = 280
//                        score += tempScore
//                    case 7:
//                        tempScore = 560
//                        score += tempScore
//                    case 8:
//                        tempScore = 1050
//                        score += tempScore
//                    case 9:
//                        tempScore = 1960
//                        score += tempScore
//                    case 10:
//                        tempScore  = 3640
//                        score += tempScore
//                    case 11:
//                        tempScore = 6720
//                        score += tempScore
//                    case 12:
//                        tempScore = 12390
//                        score += tempScore
//                    case 13:
//                        tempScore = 22820
//                        score += tempScore
//                    default:
//                        tempScore = 0
//                    }
//                }
//            }
//        }
//        else if value == 5{
//            for i in soretedStack {
//                score += i.rank.rawValue * reward
//            }
//        }
//        else if value == 6{
//            for i in soretedStack {
//                score += i.rank.rawValue * reward
//            }
//        }
//        else if value == 7 {
//            score += soretedStack[0].rank.rawValue * 1000 + soretedStack[1].rank.rawValue * 1000 + soretedStack[2].rank.rawValue * 1000 + soretedStack[3].rank.rawValue * 10 + soretedStack[4].rank.rawValue * 10
//
//        }
//        else if value == 8 {
//            score += soretedStack[0].rank.rawValue * 1200 + soretedStack[1].rank.rawValue * 1200 + soretedStack[2].rank.rawValue * 1200 + soretedStack[3].rank.rawValue * 1200 + soretedStack[4].rank.rawValue * 1
//        }
//        else if value == 9{
//            for i in soretedStack {
//                score += i.rank.rawValue * reward
//            }
//        }
//        else if value == 10{
//            for i in soretedStack {
//                score += i.rank.rawValue * reward
//            }
//        }
//
//        return score
//    }
//
//    func rankDeck (hand:Hand,type:String,value:Int) {
//        switch hand.name{
//        case "bot1":
//            if (type == "FrontHand"){
//                playerBot1!.rankFrontHand = value
//            }
//            if (type == "MiddleHand"){
//                playerBot1!.rankMiddleHand = value
//            }
//            if (type == "BackHand"){
//                playerBot1!.rankBackHand = value
//            }
//        case "bot2":
//            if (type == "FrontHand"){
//                playerBot2!.rankFrontHand = value
//            }
//            if (type == "MiddleHand"){
//                playerBot2!.rankMiddleHand = value
//            }
//            if (type == "BackHand"){
//                playerBot2!.rankBackHand = value
//            }
//        case "bot3":
//            if (type == "FrontHand"){
//                playerBot3!.rankFrontHand = value
//            }
//            if (type == "MiddleHand"){
//                playerBot3!.rankMiddleHand = value
//            }
//            if (type == "BackHand"){
//                playerBot3!.rankBackHand = value
//            }
//        case "player":
//            if (type == "FrontHand"){
//                myPlayer!.rankFrontHand = value
//            }
//            if (type == "MiddleHand"){
//                myPlayer!.rankMiddleHand = value
//            }
//            if (type == "BackHand"){
//                myPlayer!.rankBackHand = value
//            }
//        default:
//            return
//        }
//    }
    
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
