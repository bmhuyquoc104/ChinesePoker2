//
//  Card.swift
//  ChinesePoker2
//
//  Created by Võ Quốc Huy on 22/08/2022.
//

import Foundation
import SwiftUI



enum Rank: Int,CaseIterable,Comparable{
    case Two=1, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King, Ace
    static func < (lhs:Rank,rhs:Rank)->Bool{
        return lhs.rawValue < rhs.rawValue
    }
}

enum Suit{
    case Club, Diamond, Heart,Spade
}

enum HandType{
    case Invalid, HighCard, Pair, TwoPair,ThreeOfAKind,Straight,Flush,FullHouse,FourOfAKind,StraighFlush,RoyalFlush
    init(cards:Deck){
        var returnType: Self = .Invalid
        if (cards.count == 3) {
            let sortedHand = cards.sortByRank()
            if (sortedHand[1].rank == sortedHand[2].rank && sortedHand[0].rank == sortedHand[2].rank){
                returnType = .ThreeOfAKind
            }
            else if (sortedHand[0].rank == sortedHand[1].rank || sortedHand[1].rank == sortedHand[2].rank){
                returnType = .Pair
            }
            else{
                returnType = .HighCard
            }
        }
        if (cards.count == 5) {
            let sortedHand = cards.sortByRank()
            print(sortedHand)
            if (sortedHand[0].rank == sortedHand[1].rank || sortedHand[1].rank == sortedHand[2].rank || sortedHand[2].rank == sortedHand[3].rank || sortedHand[3].rank == sortedHand[4].rank){
                returnType = .Pair
            }
            if ((sortedHand[0].rank == sortedHand[1].rank && sortedHand[2].rank == sortedHand[3].rank) ||
                (sortedHand[1].rank == sortedHand[2].rank && sortedHand[3].rank == sortedHand[4].rank)) ||
                (sortedHand[0].rank == sortedHand[1].rank && sortedHand[3].rank == sortedHand[4].rank){
                returnType = .TwoPair
            }
            if ((sortedHand[0].rank == sortedHand[1].rank && sortedHand[1].rank == sortedHand[2].rank) ||
                (sortedHand[1].rank == sortedHand[2].rank && sortedHand[2].rank == sortedHand[3].rank) ||
                (sortedHand[2].rank == sortedHand[3].rank && sortedHand[3].rank == sortedHand[4].rank)){
                returnType = .ThreeOfAKind
            }
            if (sortedHand[0].rank == sortedHand[1].rank && sortedHand[3].rank == sortedHand[4].rank && (sortedHand[1].rank == sortedHand[2].rank || sortedHand[2].rank == sortedHand[3].rank)){
                returnType = .FullHouse
            }
            if (sortedHand[1].rank == sortedHand[2].rank && sortedHand[2].rank == sortedHand[3].rank && (sortedHand[3].rank == sortedHand[4].rank || sortedHand[0].rank == sortedHand[1].rank)){
                returnType = .FourOfAKind
            }
           
            
            var isStraight = true
            var isFlush = true
            for (i,_) in sortedHand.enumerated(){
                if i + 1 < 5{
                    if i == 0 && sortedHand[0].rank == .Ace{
                        if ((sortedHand[i].rank.rawValue % 14) - (sortedHand[i+1].rank.rawValue % 14)) != 1 &&
                            ((sortedHand[i+1].rank.rawValue % 12) - (sortedHand[i].rank.rawValue % 12)) != 3{
                            isStraight = false
                        }
                    }
                    else{
                        if ((sortedHand[i].rank.rawValue % 13) - (sortedHand[i+1].rank.rawValue % 13)) != 1 {
                            isStraight =  false
                        }
                    }
                    if sortedHand[i].suit != sortedHand[i+1].suit{
                        isFlush = false
                    }
                }
            }
            if (isStraight){
                returnType = .Straight
            }
          
            if (isFlush) {
                returnType = .Flush
            }
            if (isFlush && isStraight) {
                returnType = .StraighFlush
            }
            if (isStraight && sortedHand[4].rank == .Ten){
                returnType = .RoyalFlush
            }
            
            
            if (!isStraight && !isFlush && (sortedHand[0].rank != sortedHand[1].rank && sortedHand[1].rank != sortedHand[2].rank && sortedHand[2].rank != sortedHand[3].rank && sortedHand[3].rank != sortedHand[4].rank)){
                returnType = .HighCard
            }
           
        }
        self = returnType

    }
}

struct Card:Identifiable, Equatable, Hashable {
    var id = UUID()
    var rank: Rank
    var suit: Suit
    var image: String{
        get{
            return "\(suit) \(rank)"
        }
    }
    static func testData () -> [Card] {
        let cards = [
            Card(rank: .Two, suit: .Club),
            Card(rank: .Three, suit: .Club),
            Card(rank: .Four, suit: .Club),
            Card(rank: .Ten, suit: .Club),
            Card(rank: .Jack, suit: .Club),
            Card(rank: .Queen, suit: .Club),
            Card(rank: .King, suit: .Club),
            Card(rank: .Ace, suit: .Club),
            Card(rank: .Nine, suit: .Club),
            Card(rank: .Eight, suit: .Club),
            Card(rank: .Seven, suit: .Club),
            Card(rank: .Six, suit: .Club),
            Card(rank: .Five, suit: .Club)
        ]
        return cards
    }
    
}

typealias Deck = [Card]

extension Deck where Element == Card {
    func sortByRank () -> Self {
        var sortedHand = Deck()
        var remainingCard = self
        for _ in 1...remainingCard.count{
            var highestCardIndex = 0
            for (i, _) in remainingCard.enumerated(){
                if i + 1 < remainingCard.count{
                    if remainingCard[i+1].rank > remainingCard[highestCardIndex].rank {
                        highestCardIndex = i + 1
                    }
                }
            }
            let highestCard = remainingCard.remove(at: highestCardIndex)
            sortedHand.append(highestCard)
        }
        return sortedHand
    }
}
