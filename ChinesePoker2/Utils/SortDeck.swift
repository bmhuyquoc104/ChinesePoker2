//
//  SortDeck.swift
//  ChinesePoker2
//
//  Created by Võ Quốc Huy on 25/08/2022.
//

import Foundation

struct SortDeck {
    static func sortByRankAndOccurence(stack:Stack) -> Array<(key: Rank, value: Int)> {
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
        return soretedRankCount
    }

}
