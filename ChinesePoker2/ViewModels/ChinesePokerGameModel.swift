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
            Player(playerName: "Steve",isBot: true, score: 5000, image: "avatar2"),
            Player(playerName: "Chris",  isBot: true, score: 3000, image: "avatar1"),
            Player(playerName: "David",  isBot: true, score: 2000, image: "avatar3")
        ]
        players = bot
        players.append(Player(playerName: "Huy", isBot: false, score: 70000, image: "daredevil"))
        
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
    
    func arrangeDeck(stack:Stack) ->Stack {
        var isPair = false
        var isTwoPair = false
        var isThreeOfAKind = false
        var isStraight = false
        var isFlush = false
        var isFullHouse = false
        var isFourOfAKind = false
        var isStraightFlush = false
        var isRoyalFlush = false
        var rankCount = [Rank:Int]()
        var suitCount = [Suit:Int]()
        var playerCardsByRank = stack.sortByRank()
        for card in playerCardsByRank {
            if rankCount[card.rank] != nil {
                rankCount[card.rank]! += 1
            }
            else{
                rankCount[card.rank] = 1
            }
            if suitCount[card.suit] != nil {
                suitCount[card.suit]! += 1
            }
            else {
                suitCount[card.suit] = 1
            }
        }
        
        let soretedRankCount = rankCount.sorted {
            if $0.value != $1.value {
                return $0.value > $1.value
            }
            else {
                return $0.key.rawValue > $1.key.rawValue
            }
        }
        let sortedByKeyRank = rankCount.sorted { $0.key.rawValue > $1.key.rawValue }

        
        let sortedSuitCount = suitCount.sorted { $0.1 > $1.1 }
        var cardRankCount = 1
        var cardRankCount2 = 1
        
        var possibleHands = Stack()
        
        for rank in Rank.allCases{
            if let count = rankCount[rank]{
                print ("\(rank)-\(count)")
            }
            var thisRankCount = 0
            if (rankCount[rank] != nil){
                thisRankCount = rankCount[rank]!
            }
            else{
                continue
            }
            
            
            if thisRankCount > cardRankCount{
                if cardRankCount != 1{
                    cardRankCount2 = cardRankCount
                }
                cardRankCount = thisRankCount
            }
            else if thisRankCount > cardRankCount2{
                cardRankCount2 = thisRankCount
            }
            isPair = cardRankCount > 1
            isTwoPair = cardRankCount > 1 && cardRankCount2 > 1
            isThreeOfAKind = cardRankCount > 2
            isFourOfAKind = cardRankCount > 3
            isFullHouse = cardRankCount > 2 && cardRankCount2 > 1
            
            if isStraight {
                continue
            }
            else{
                isStraight = true
            }
            for i in 0...4{
                var rankRawValue = 1
                if rank <= Rank.Ten{
                    print(rank)
                    rankRawValue = rank.rawValue + i
                }
                else if rank == Rank.Ace {
                    rankRawValue = (rank.rawValue + i) % 13
                    if rankRawValue == 0{
                        rankRawValue = 13
                    }
                }
                if rankCount[Rank(rawValue: rankRawValue)!] != nil {
                    print(rankRawValue)
                    isStraight = isStraight && rankCount[Rank(rawValue: rankRawValue)!]! > 0
                }
                else {
                    isStraight = false
                }
            }
            for suit in Suit.allCases{
                var thisSuitCount = 0
                if suitCount[suit] != nil {
                    thisSuitCount = suitCount[suit]!
                }
                isFlush = thisSuitCount > 5
            }
            if (isStraight && isFlush){
                isStraightFlush = true
            }
        }
        
//        if (isStraightFlush){
//            continue
//        }
        
        if isFourOfAKind {
            for card in playerCardsByRank{
                if card.rank == soretedRankCount[0].key{
                    possibleHands.append(card)
                }
                if possibleHands.count < 5 {
                    if card.rank == soretedRankCount[soretedRankCount.count - 1].key{
                        possibleHands.append(card)
                    }
                }
                else{
                    break
                }
            }
        }
        
        else if isFullHouse{
            let lastIndex = soretedRankCount.lastIndex ( where: {$0.value == 2})
            for card in playerCardsByRank{
                if card.rank == soretedRankCount[0].key{
                    possibleHands.append(card)
                }
                if possibleHands.count < 5 {
                    if card.rank == soretedRankCount[lastIndex!].key{
                        possibleHands.append(card)
                    }
                }
                else{
                    break
                }
                
                
            }
        }
        
        else if isFlush{
            for card in playerCardsByRank {
                if possibleHands.count < 5 {
                    if card.suit == sortedSuitCount[0].key{
                        possibleHands.append(card)
                    }
                }
                else{
                    break
                }
            }
        }
        
//        else if isStraight{
//            var count = 0
//            var tempArr = [Rank:Int]()
//            for i in 0..<sortedByKeyRank.count - 1{
//                let current = sortedByKeyRank[i].key.rawValue
//                let next = sortedByKeyRank[i+1].key.rawValue
//                let temp = current - next
//                if temp == 1 {
//                    count += 1
//                }
//                else if temp == 0 {
//                    continue
//                }
//                else {
//                    count = 0
//                }
//                if count == 5{
//                    for card in playerCardsByRank{
//                        if card.rank == sortedByKeyRank[i].key ||
//                            card.rank == sortedByKeyRank[i-1].key ||
//                            card.rank == sortedByKeyRank[i-2].key ||
//                            card.rank == sortedByKeyRank[i-3].key ||
//                            card.rank == sortedByKeyRank[i-4].key {
//                            possibleHands.append(card)
//                        }
//                    }
//                    break
//                }
//            }
//            if count < 5 {
//                for card in playerCardsByRank{
//                    if card.rank == sortedByKeyRank[0].key ||
//                        card.rank == sortedByKeyRank[soretedRankCount.count-1].key ||
//                        card.rank == sortedByKeyRank[soretedRankCount.count-2].key ||
//                        card.rank == sortedByKeyRank[soretedRankCount.count-3].key ||
//                        card.rank == sortedByKeyRank[soretedRankCount.count-4].key {
//                        possibleHands.append(card)
//                    }
//                }
//            }
//            if possibleHands.count > 5{
//                for i in 0..<possibleHands.count - 1 {
//                    let currentIndex = possibleHands[i].rank.rawValue
//                    let nextIndex = possibleHands[i+1].rank.rawValue
//                    if (currentIndex == nextIndex){
//                        possibleHands.remove(at: i)
//                        if (possibleHands.count == 5){
//                            break
//                        }
//                    }
//                }
//            }
//        }
        
        else if isThreeOfAKind{
            if (playerCardsByRank.count != 3) {
                for card in playerCardsByRank{
                    if card.rank == soretedRankCount[0].key{
                        possibleHands.append(card)
                    }
                    if possibleHands.count<5 {
                        if card.rank == soretedRankCount[soretedRankCount.count-1].key || card.rank == soretedRankCount[soretedRankCount.count-2].key{
                            possibleHands.append(card)
                        }
                    }
                    else{
                        break
                    }
                }
            }
            else{
                for card in playerCardsByRank{
                    if card.rank == soretedRankCount[0].key{
                        possibleHands.append(card)
                    }
                }
            }
            
        }
        else if isTwoPair{
            for card in playerCardsByRank{
                if card.rank == soretedRankCount[0].key || card.rank == soretedRankCount[1].key{
                    possibleHands.append(card)
                }
                if possibleHands.count < 5 {
                    if card.rank == soretedRankCount[soretedRankCount.count-1].key{
                        possibleHands.append(card)
                    }
                }
                else{
                    break
                }
            }
        }
        else if isPair {
            if playerCardsByRank.count != 3 {
                for card in playerCardsByRank{
                    if card.rank == soretedRankCount[0].key{
                        possibleHands.append(card)
                    }
                    if possibleHands.count < 5{
                        if card.rank == soretedRankCount[soretedRankCount.count-1].key ||
                            card.rank == soretedRankCount[soretedRankCount.count-2].key ||
                            card.rank == soretedRankCount[soretedRankCount.count-3].key{
                            possibleHands.append(card)
                        }
                    }
                    else{
                        break
                    }
                }
            }
            else{
                for card in playerCardsByRank{
                    if card.rank == soretedRankCount[0].key{
                        possibleHands.append(card)
                    }
                    if card.rank == soretedRankCount[soretedRankCount.count-1].key{
                        possibleHands.append(card)
                    }
                }
            }
        }
        else {
            if playerCardsByRank.count != 3 {
                for card in playerCardsByRank{
                    if  card.rank == soretedRankCount[0].key ||
                        card.rank == soretedRankCount[1].key ||
                        card.rank == soretedRankCount[2].key ||
                        card.rank == soretedRankCount[3].key ||
                        card.rank == soretedRankCount[4].key{
                        possibleHands.append(card)
                    }
                }
            }
            else{
                for card in playerCardsByRank{
                    if  card.rank == soretedRankCount[0].key ||
                        card.rank == soretedRankCount[1].key ||
                        card.rank == soretedRankCount[2].key{
                        possibleHands.append(card)
                    }
                }
            }
            
        }        
        var botHand = Stack()
        botHand = possibleHands
        return botHand
    }
    
    
    func botLogic(player:Player) -> Stack {
        var playerCardsByRank = player.playerCards
        let backHand = arrangeDeck(stack: playerCardsByRank)
        
        playerCardsByRank.removeAll(where: { backHand.contains($0) })
        let middleHand = arrangeDeck(stack: playerCardsByRank)
        playerCardsByRank.removeAll(where: { middleHand.contains($0) })
        let frontHand = arrangeDeck(stack: playerCardsByRank)
        let model = CardModel()
        let backHandValue = "\(model.evaluateHand(cards: backHand))"
        let middleHandValue = "\(model.evaluateHand(cards: middleHand))"
        let frontHandValue = "\(model.evaluateHand(cards: frontHand))"
        print(backHandValue)
        print(middleHandValue)
        print(frontHandValue)
        var botHand = Stack()
        botHand = [frontHand[0],frontHand[1],frontHand[2],middleHand[0],middleHand[1],middleHand[2],middleHand[3],middleHand[4],backHand[0],backHand[1],backHand[2],backHand[3],backHand[4]]
//        var middleHand = Stack()
       
        
//        botHand = possibleHands
        return botHand
    }
    
}
