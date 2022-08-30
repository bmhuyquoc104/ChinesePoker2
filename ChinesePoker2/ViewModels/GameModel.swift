/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 2
 Author: Your name (e.g. Vo Quoc Huy)
 ID: Your student id (e.g. s3823236)
 Created  date: dd/mm/yyyy (e.g. 22/08/2022)
 Last modified: dd/mm/yyyy (e.g. 22/08/2022)
 Acknowledgement:  https://www.youtube.com/watch?v=hJ3v6MtLGnI&t=1128s

 */

import Foundation

class GameModel:ObservableObject{
    // Published variable to access and update in other views
    @Published var mode:String?
    @Published var players = [Player]()
    @Published var betAmount:Int?
    @Published var playerBot1: Player = Player(playerName: "Steve",isBot: true, money: 2000, image: "avatar5",achievements: [])
    @Published var playerBot2:Player = Player(playerName: "XiaoBao",isBot: true, money: 5000, image: "avatar4",achievements: [])
    @Published var playerBot3:Player = Player(playerName: "Seri",isBot: true, money: 1000, image: "avatar6",achievements: [])
    @Published var myPlayer:Player?
    init(){
        createPlayers(currentPlayer: Player(playerName: "Huy", isBot: false, money: 70000, image: "daredevil",achievements: [Achievement(name: "Silver", description: "Earn $100", image: "Silver"),Achievement(name: "Platinum", description: "Earn $500", image: "Platinum"),Achievement(name: "Gold", description: "Earn $1000", image: "Gold"),Achievement(name: "Diamond", description: "Earn $10000", image: "Diamond"),Achievement(name: "Master", description: "Earn $50000", image: "Master"),Achievement(name: "Challenger", description: "Earn $100000", image: "Challenger"),Achievement(name: "", description: "1day streak", image: "1day-streak")]))
    }
    
    // Function create all players (3 bots and current player)
    func createPlayers(currentPlayer:Player){
        let bot = [
            playerBot1,playerBot2,playerBot3
        ]
        players = bot
        players.append(currentPlayer)
        // Create deck for each player
        var deck = Deck()
        deck.createDeck()
        // Shuffle the deck
        deck.deckShuffle()
        
        // random the player index
        let randomPlayerIndex = Int(arc4random()) % players.count
        
        // Duel the card to each player in order
        while deck.cardLength() > 0 {
            for player in randomPlayerIndex...randomPlayerIndex + (players.count - 1) {
                let i = player % players.count
                let card = deck.getCard()
                players[i].playerCards.append(card)
            }
        }
        myPlayer = players[3]
    }
    
    // Function to let the bot arrange the deck
    func arrangeDeck(stack:Stack) ->Stack {
        // Declare multiple variables to track if the handtype is exist or not
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
            
            for suit in Suit.allCases{
                var thisSuitCount = 0
                if suitCount[suit] != nil {
                    thisSuitCount = suitCount[suit]!
                }
                isFlush = thisSuitCount == 5
            }
            if (isStraight && isFlush){
                isStraightFlush = true
            }
        }
        
        // Check if the mode is hard or not
        if mode == "Hard"{
            // If the mode is hard -> arrange the deck by these hand types below
            // Get cards that form four of a kind
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
            // Get cards that form full house
            else if isFullHouse{
                //            let firstIndex = soretedRankCount.firstIndex( where: {$0.value == 2})
                for card in playerCardsByRank{
                    if possibleHands.count < 5 {
                        if card.rank == soretedRankCount[0].key || card.rank == soretedRankCount[1].key{
                            possibleHands.append(card)
                        }
                    }
                    else{
                        break
                    }
                }
            }
            // Get cards that form flush
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
            // Get cards that form three of a kind
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
            // Get cards that form two pairs
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
            // Get cards that form one pair
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
            // Get cards that form high card
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
        }
        
        // Check if the mode is medium
        else if mode == "Medium"{
            // Similar to hard but remove 4 of a kind and full house handtype -> make user have a higher chance to win
            if isFlush{
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
        }
        
        // Check if mode is easy
        else if mode == "Easy"{
            // Similar to hard but remove 4 of a kind and full house, flush handtype -> make user have a higher chance to win
            if isThreeOfAKind{
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
        }
        
        // return the bothand that contain the best combination for possible hand
        var botHand = Stack()
        botHand = possibleHands
        return botHand
    }
    
    
    // Function to determine the logic for the bot
    func botLogic(player:Player) -> Stack {
        // Get the deck for this bot
        var playerCardsByRank = player.playerCards
        // Arrange back hand
        let backHand = arrangeDeck(stack: playerCardsByRank)
        // Remove the back hand cards from deck arr (orginal 13, after slide -> new 8)
        playerCardsByRank.removeAll(where: { backHand.contains($0) })
        // Arrange middle hand
        let middleHand = arrangeDeck(stack: playerCardsByRank)
        // Remove the middle hand cards from deck arr (original 8, after slide -> new 3)
        playerCardsByRank.removeAll(where: { middleHand.contains($0) })
        // Arrage front hand
        let frontHand = arrangeDeck(stack: playerCardsByRank)
        // Return the new deck after rearrange back, middle, front (100% front < middle < back)
        var botHand = Stack()
        botHand = [frontHand[0],frontHand[1],frontHand[2],middleHand[0],middleHand[1],middleHand[2],middleHand[3],middleHand[4],backHand[0],backHand[1],backHand[2],backHand[3],backHand[4]]
        return botHand
    }
    
    // Function to compare the hand
    func compareHand(bot1:Stack,bot2:Stack,bot3:Stack,player:Stack,type:String){
        
        let model = CardModel()
        let bot1Value = model.evaluateHand(cards: bot1).rawValue
        let bot2Value = model.evaluateHand(cards: bot2).rawValue
        let bot3Value = model.evaluateHand(cards: bot3).rawValue
        let playerValue = model.evaluateHand(cards: player).rawValue
        
        print("player value: \(playerValue)")
        print("bot1Value: \(bot1Value)")
        print("bot2Value: \(bot2Value)")
        print("bot3Value: \(bot3Value)")
        
        
        let soretedBot1 = bot1.sorted {
            return $0.rank.rawValue > $1.rank.rawValue
        }
        
        let soretedBot2 = bot1.sorted {
            return $0.rank.rawValue > $1.rank.rawValue
        }
        
        let soretedBot3 = bot1.sorted {
            return $0.rank.rawValue > $1.rank.rawValue
        }
        
        let scoreBot1 = calculateScore(stack:bot1,value:bot1Value)
        let scoreBot2 = calculateScore(stack:bot2,value:bot2Value)
        let scoreBot3 = calculateScore(stack:bot3,value:bot3Value)
        let playerScore = calculateScore(stack: player, value: playerValue)
        
        let frontHand1 = Hand(stack: bot1, frontHandScore: scoreBot1,evaluatedScore:bot1Value,name:"bot1")
        let frontHand2 = Hand(stack: bot2, frontHandScore: scoreBot2,evaluatedScore: bot2Value,name:"bot2")
        let frontHand3 = Hand(stack: bot3, frontHandScore: scoreBot3,evaluatedScore: bot3Value,name:"bot3")
        let playerFrontHand = Hand(stack: player, frontHandScore: playerScore,evaluatedScore: playerValue,name:"player")
        
        
        let handArr:[Hand] = [frontHand1,frontHand2,frontHand3,playerFrontHand].sorted{
            if ($0.evaluatedScore != $1.evaluatedScore){
                return $0.evaluatedScore > $1.evaluatedScore
            }
            return $0.frontHandScore > $1.frontHandScore
        }
        
        rankDeck(hand: handArr[0], type: type, value: 2)
        rankDeck(hand: handArr[1], type: type, value: 1)
        rankDeck(hand: handArr[2], type: type, value: -1)
        rankDeck(hand: handArr[3], type: type, value: -2)
        
        //        print(handArr[0].stack)
        //        print(handArr[1].stack)
        //        print(handArr[2].stack)
        //        print(handArr[3].stack)
        
    }
    
    
    // Function to calculate the score for each handtype case to compare if the value is equal (for example: 4 hands have pair handtype, to determine with one is the largest, calculate the score, highest -> first-ranked
    func calculateScore (stack:Stack,value:Int) -> Int{
        var score = 0
        var reward = 0
        let soretedStack = stack.sorted {
            return $0.rank.rawValue > $1.rank.rawValue
        }
        let sortedStackByRankAndOccurence = SortDeck.sortByRankAndOccurence(stack: stack)
        
        switch value {
        case 1:
            reward = 1
        case 2 :
            reward = 10
        case 3 :
            reward = 100
        case 4:
            reward = 400
        case 5:
            reward = 600
        case 6:
            reward = 800
        case 7:
            reward = 1000
        case 8:
            reward = 1200
        case 9:
            reward = 1400
        case 10:
            reward = 1600
        default:
            score = 0
        }
        
        // Score calculation for highcard case
        if (value == 1) {
            for i in 0..<soretedStack.count - 1{
                let current = soretedStack[i].rank.rawValue
                let next = soretedStack[i+1].rank.rawValue
                let temp = current - next
                // Check (A,Q,J) and (A,K,1) -> Need new calculation way instead of plus three cards because A,Q,J is next to each other and will has the higher score than A,K,1. Thus, it is incorrect -> implement unique score logic for to overcome this case
                if (temp == 1) {
                    var tempScore = 0
                    switch soretedStack[i].rank.rawValue{
                    case 1:
                        tempScore = 2
                        score += tempScore + 20
                    case 2:
                        tempScore = 3
                        score += tempScore + 20
                    case 3:
                        tempScore = 4
                        score += tempScore + 20
                    case 4:
                        tempScore = 70
                        score += tempScore + 20
                    case 5:
                        tempScore = 140
                        score += tempScore + 20
                    case 6:
                        tempScore = 280
                        score += tempScore + 20
                    case 7:
                        tempScore = 560
                        score += tempScore + 20
                    case 8:
                        tempScore = 1050
                        score += tempScore + 20
                    case 9:
                        tempScore = 1960
                        score += tempScore + 20
                    case 10:
                        tempScore  = 3640
                        score += tempScore + 20
                    case 11:
                        tempScore = 6720
                        score += tempScore + 20
                    case 12:
                        tempScore = 12390
                        score += tempScore + 20
                    case 13:
                        tempScore = 22820
                        score += tempScore + 20
                    default:
                        tempScore = 0
                    }
                    
                }
                else {
                    var tempScore = 0
                    switch soretedStack[i].rank.rawValue{
                    case 1:
                        tempScore = 2
                        score += tempScore
                    case 2:
                        tempScore = 3
                        score += tempScore
                    case 3:
                        tempScore = 4
                        score += tempScore
                    case 4:
                        tempScore = 70
                        score += tempScore
                    case 5:
                        tempScore = 140
                        score += tempScore
                    case 6:
                        tempScore = 280
                        score += tempScore
                    case 7:
                        tempScore = 560
                        score += tempScore
                    case 8:
                        tempScore = 1050
                        score += tempScore
                    case 9:
                        tempScore = 1960
                        score += tempScore
                    case 10:
                        tempScore  = 3640
                        score += tempScore
                    case 11:
                        tempScore = 6720
                        score += tempScore
                    case 12:
                        tempScore = 12390
                        score += tempScore
                    case 13:
                        tempScore = 22820
                        score += tempScore
                    default:
                        tempScore = 0
                    }
                }
            }
            
        }
        // Score calculation for pair case
        else if value == 2{
            if (sortedStackByRankAndOccurence.count == 2){
                score += sortedStackByRankAndOccurence[0].key.rawValue * 20 + sortedStackByRankAndOccurence[0].key.rawValue * 20 + sortedStackByRankAndOccurence[1].key.rawValue
            }
            else{
                score += sortedStackByRankAndOccurence[0].key.rawValue * 20 + sortedStackByRankAndOccurence[0].key.rawValue * 20 + sortedStackByRankAndOccurence[1].key.rawValue
                + sortedStackByRankAndOccurence[2].key.rawValue + sortedStackByRankAndOccurence[3].key.rawValue
            }
        }
        // Score calculation for three of a kind case
        else if value == 4{
            if (sortedStackByRankAndOccurence.count == 1){
                score += sortedStackByRankAndOccurence[0].key.rawValue * 100 + sortedStackByRankAndOccurence[0].key.rawValue * 100 + sortedStackByRankAndOccurence[0].key.rawValue * 100
            }
            else{
                score += sortedStackByRankAndOccurence[0].key.rawValue * 100 + sortedStackByRankAndOccurence[0].key.rawValue * 100 + sortedStackByRankAndOccurence[0].key.rawValue * 100 + sortedStackByRankAndOccurence[1].key.rawValue + sortedStackByRankAndOccurence[2].key.rawValue
            }
            
        }
        // Score calculation for 2 pairs case
        else if value == 3{
            for i in 0..<sortedStackByRankAndOccurence.count - 1{
                let first = sortedStackByRankAndOccurence[0].key.rawValue
                let second = sortedStackByRankAndOccurence[2].key.rawValue
                let temp = second - first
                if (temp == 1) {
                    var tempScore = 0
                    switch sortedStackByRankAndOccurence[i].key.rawValue{
                    case 1:
                        tempScore = 2
                        score += tempScore + 20
                    case 2:
                        tempScore = 3
                        score += tempScore + 20
                    case 3:
                        tempScore = 4
                        score += tempScore + 20
                    case 4:
                        tempScore = 70
                        score += tempScore + 20
                    case 5:
                        tempScore = 140
                        score += tempScore + 20
                    case 6:
                        tempScore = 280
                        score += tempScore + 20
                    case 7:
                        tempScore = 560
                        score += tempScore + 20
                    case 8:
                        tempScore = 1050
                        score += tempScore + 20
                    case 9:
                        tempScore = 1960
                        score += tempScore + 20
                    case 10:
                        tempScore  = 3640
                        score += tempScore + 20
                    case 11:
                        tempScore = 6720
                        score += tempScore + 20
                    case 12:
                        tempScore = 12390
                        score += tempScore + 20
                    case 13:
                        tempScore = 22820
                        score += tempScore + 20
                    default:
                        tempScore = 0
                    }
                    
                }
                else {
                    var tempScore = 0
                    switch sortedStackByRankAndOccurence[i].key.rawValue{
                    case 1:
                        tempScore = 2
                        score += tempScore
                    case 2:
                        tempScore = 3
                        score += tempScore
                    case 3:
                        tempScore = 4
                        score += tempScore
                    case 4:
                        tempScore = 70
                        score += tempScore
                    case 5:
                        tempScore = 140
                        score += tempScore
                    case 6:
                        tempScore = 280
                        score += tempScore
                    case 7:
                        tempScore = 560
                        score += tempScore
                    case 8:
                        tempScore = 1050
                        score += tempScore
                    case 9:
                        tempScore = 1960
                        score += tempScore
                    case 10:
                        tempScore  = 3640
                        score += tempScore
                    case 11:
                        tempScore = 6720
                        score += tempScore
                    case 12:
                        tempScore = 12390
                        score += tempScore
                    case 13:
                        tempScore = 22820
                        score += tempScore
                    default:
                        tempScore = 0
                    }
                }
            }
        }
        // Score calculation for straight case
        else if value == 5{
            for i in soretedStack {
                score += i.rank.rawValue * reward
            }
        }
        // Score calculation for flush case
        else if value == 6{
            for i in soretedStack {
                score += i.rank.rawValue * reward
            }
        }
        // Score calculation for full house case
        else if value == 7 {
            score += sortedStackByRankAndOccurence[0].key.rawValue * 1000 + sortedStackByRankAndOccurence[0].key.rawValue * 1000 + sortedStackByRankAndOccurence[0].key.rawValue * 1000 + sortedStackByRankAndOccurence[1].key.rawValue * 10 + sortedStackByRankAndOccurence[1].key.rawValue * 10
            
        }
        // Score calculation for four of a kind case
        else if value == 8 {
            score += sortedStackByRankAndOccurence[0].key.rawValue * 1200 + sortedStackByRankAndOccurence[0].key.rawValue * 1200 + sortedStackByRankAndOccurence[0].key.rawValue * 1200 + sortedStackByRankAndOccurence[0].key.rawValue * 1200 + sortedStackByRankAndOccurence[1].key.rawValue * 1
        }
        // Score calculation for straight flush case
        else if value == 9{
            for i in soretedStack {
                score += i.rank.rawValue * reward
            }
        }
        // Score calculation for royal flush case
        else if value == 10{
            for i in soretedStack {
                score += i.rank.rawValue * reward
            }
        }
        
        return score
    }
    
    // Function to update the rank for front, middle,back hand for 4 players to compare in other views
    func rankDeck (hand:Hand,type:String,value:Int) {
        switch hand.name{
        case "bot1":
            if (type == "FrontHand"){
                playerBot1.rankFrontHand = value
            }
            if (type == "MiddleHand"){
                playerBot1.rankMiddleHand = value
            }
            if (type == "BackHand"){
                playerBot1.rankBackHand = value
            }
        case "bot2":
            if (type == "FrontHand"){
                playerBot2.rankFrontHand = value
            }
            if (type == "MiddleHand"){
                playerBot2.rankMiddleHand = value
            }
            if (type == "BackHand"){
                playerBot2.rankBackHand = value
            }
        case "bot3":
            if (type == "FrontHand"){
                playerBot3.rankFrontHand = value
            }
            if (type == "MiddleHand"){
                playerBot3.rankMiddleHand = value
            }
            if (type == "BackHand"){
                playerBot3.rankBackHand = value
            }
        case "player":
            if (type == "FrontHand"){
                myPlayer!.rankFrontHand = value
            }
            if (type == "MiddleHand"){
                myPlayer!.rankMiddleHand = value
            }
            if (type == "BackHand"){
                myPlayer!.rankBackHand = value
            }
        default:
            return
        }
    }
    
    // Function to update the bot3 money if it is <=0, plus change the name and avatar to let the user feel like new player coming
    func updateBot3() {
        if playerBot3.money <= 0 {
            playerBot3.money = 100000
            playerBot3.image = "avatar3"
            playerBot3.playerName = "Vermouth"
        }
    }
    // Function to update the bot2 money if it is <=0, plus change the name and avatar to let the user feel like new player coming
    func updateBot2(){
        if playerBot2.money <= 0 {
            playerBot2.money = 100000
            playerBot2.image = "avatar5"
            playerBot2.playerName = "Vodka"
        }
    }
    // Function to update the bot money if it is <=0, plus change the name and avatar to let the user feel like new player coming
    func updateBot1(){
        if playerBot1.money <= 0 {
            playerBot1.money = 100000
            playerBot1.image = "avatar7"
            playerBot1.playerName = "Gin"
        }
    }
    
    
    
    
    
}
