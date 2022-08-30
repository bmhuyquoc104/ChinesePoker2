/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 2
 Author: Your name (e.g. Vo Quoc Huy)
 ID: Your student id (e.g. s3823236)
 Created  date: dd/mm/yyyy (e.g. 25/08/2022)
 Last modified: dd/mm/yyyy (e.g. 25/08/2022)
 Acknowledgement:
 */

import Foundation

// Function to sort the deck by rank and occurence.
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
        
        // Check the occurence before the rank value
        let soretedRankCount = rankCount.sorted {
            // If the occurence is not the same -> sort by occurence
            if $0.value != $1.value {
                return $0.value > $1.value
            }
            // Sort by rank
            else {
                return $0.key.rawValue > $1.key.rawValue
            }
        }
        return soretedRankCount
    }

}
