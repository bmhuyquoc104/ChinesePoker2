/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 2
 Author: Your name (e.g. Vo Quoc Huy)
 ID: Your student id (e.g. s3823236)
 Created  date: dd/mm/yyyy (e.g. 22/08/2022)
 Last modified: dd/mm/yyyy (e.g. 27/08/2022)
 Acknowledgement: https://www.youtube.com/watch?v=hJ3v6MtLGnI&t=1128s
 */


import Foundation
import SwiftUI


// Create an enum rank to rank the value of all cards
// Int to assign the value of each card to int, case iterable to allow looping, comparable is to compare lhs card with rhs card
enum Rank: Int,CaseIterable,Comparable{
    case Two=1, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King, Ace
    // Comparing card to sort
    static func < (lhs:Rank,rhs:Rank)->Bool{
        return lhs.rawValue < rhs.rawValue
    }
}

//case iterable to allow looping
enum Suit:CaseIterable{
    case Club, Diamond, Heart,Spade
}

// Create an enum rank to rank the value of all handtypes
// Int to assign the value of each card to int, case iterable to allow looping, comparable is to compare lhs card with rhs card
enum HandType:Int, CaseIterable, Comparable{
    case HighCard = 1, Pair, TwoPair,ThreeOfAKind,Straight,Flush,FullHouse,FourOfAKind,StraighFlush,RoyalFlush
    static func < (lhs:HandType,rhs:HandType) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
    init(cards:Stack){
        var returnType: Self = .HighCard
        // Check handtype for front hand (3cards)
        if (cards.count == 3) {
            // Sort the cards
            let sortedHand = cards.sortByRank()
            // If all elements are the same -> 1 card occur 3 -> three of a kind
            if (sortedHand[1].rank == sortedHand[2].rank && sortedHand[0].rank == sortedHand[2].rank){
                returnType = .ThreeOfAKind
            }
            // If 1 card occurs 2 times -> pair
            else if (sortedHand[0].rank == sortedHand[1].rank || sortedHand[1].rank == sortedHand[2].rank){
                returnType = .Pair
            }
            // 3 different cards -> High card
            else{
                returnType = .HighCard
            }
        }
        // Check handtype for middle and back hand (5cards)
        if (cards.count == 5) {
            let sortedHand = cards.sortByRank()
            // Check if the handtype is pair
            if (sortedHand[0].rank == sortedHand[1].rank || sortedHand[1].rank == sortedHand[2].rank || sortedHand[2].rank == sortedHand[3].rank || sortedHand[3].rank == sortedHand[4].rank){
                returnType = .Pair
            }
            // Check if the handtype is 2 pairs
            if ((sortedHand[0].rank == sortedHand[1].rank && sortedHand[2].rank == sortedHand[3].rank) ||
                (sortedHand[1].rank == sortedHand[2].rank && sortedHand[3].rank == sortedHand[4].rank)) ||
                (sortedHand[0].rank == sortedHand[1].rank && sortedHand[3].rank == sortedHand[4].rank){
                returnType = .TwoPair
            }
            // Check if the handtype is three of a kind
            if ((sortedHand[0].rank == sortedHand[1].rank && sortedHand[1].rank == sortedHand[2].rank) ||
                (sortedHand[1].rank == sortedHand[2].rank && sortedHand[2].rank == sortedHand[3].rank) ||
                (sortedHand[2].rank == sortedHand[3].rank && sortedHand[3].rank == sortedHand[4].rank)){
                returnType = .ThreeOfAKind
            }
            // Check if the handtype is fullhouse
            if (sortedHand[0].rank == sortedHand[1].rank && sortedHand[3].rank == sortedHand[4].rank && (sortedHand[1].rank == sortedHand[2].rank || sortedHand[2].rank == sortedHand[3].rank)){
                returnType = .FullHouse
            }
            // Check if the handtype is four of a kind
            if (sortedHand[1].rank == sortedHand[2].rank && sortedHand[2].rank == sortedHand[3].rank && (sortedHand[3].rank == sortedHand[4].rank || sortedHand[0].rank == sortedHand[1].rank)){
                returnType = .FourOfAKind
            }
            
            // Variable to check if the card is straight
            var isStraight = true
            // Variable to check if the card is flush
            var isFlush = true
            // Loop through the deck and check if their are consecutive
            for (i,_) in sortedHand.enumerated(){
                if i + 1 < 5{
                    // Eliminate some invalid straight with ace. For example (K,A,2,3,4)
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
                    // All cards' suit are the same -> isFlush
                    if sortedHand[i].suit != sortedHand[i+1].suit{
                        isFlush = false
                    }
                }
            }
            // Check if the handtype is straight
            if (isStraight){
                returnType = .Straight
            }
            // Check if the handtype is flush
            if (isFlush) {
                returnType = .Flush
            }
            // Check if the handtype is straight flush
            if (isFlush && isStraight) {
                returnType = .StraighFlush
            }
            // Check if the handtype is royal flush
            if (isStraight && isFlush && sortedHand[4].rank == .Ten){
                returnType = .RoyalFlush
            }
            
            // Check if the handtype is highcard
            if (!isStraight && !isFlush && (sortedHand[0].rank != sortedHand[1].rank && sortedHand[1].rank != sortedHand[2].rank && sortedHand[2].rank != sortedHand[3].rank && sortedHand[3].rank != sortedHand[4].rank)){
                returnType = .HighCard
            }
        }
        self = returnType
        
    }
}


// Struct card, hasable you for for each, equatable to compare
struct Card:Identifiable, Equatable, Hashable {
    var id = UUID()
    var rank: Rank
    var suit: Suit
    var image: String{
        get{
            return "\(suit) \(rank)"
        }
    }
    // Function for testing data
    static func testData () -> [Card] {
        let cards = [
            Card(rank: .Two, suit: .Diamond),
            Card(rank: .Ace, suit: .Spade),
            Card(rank: .Queen, suit: .Heart),
            
            Card(rank: .Ten, suit: .Club),
            Card(rank: .King, suit: .Spade),
            Card(rank: .Queen, suit: .Diamond),
            Card(rank: .Nine, suit: .Heart),
            Card(rank: .Eight, suit: .Club),
            
            Card(rank: .Five, suit: .Spade),
            Card(rank: .Nine, suit: .Spade),
            Card(rank: .Four, suit: .Club),
            Card(rank: .Three, suit: .Diamond),
            Card(rank: .King, suit: .Spade),
        ]
        return cards
    }
    
}

// Create type Stack represent for array of card
typealias Stack = [Card]

// Extension for writing sortbyrank function
extension Stack where Element == Card {
    // Sort deck by rank
    func sortByRank () -> Self {
        var sortedHand = Stack()
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

// Struct hand
struct Hand: Identifiable {
    var id = UUID()
    var stack:Stack
    var frontHandScore: Int
    var evaluatedScore: Int
    var name: String
}

//Struct Deck
struct Deck {
    var cards = Stack()
    // mutating to allow the struct updating value (default struct is immuntable)
    mutating func createDeck(){
        for suit in Suit.allCases {
            for rank in Rank.allCases{
                cards.append(Card(rank: rank, suit: suit))
            }
        }
    }
    
    // mutating to allow the struct updating value (default struct is immuntable)
    // Function to shuffle cards in deck
    mutating func deckShuffle(){
        cards.shuffle()
    }
    
    // mutating to allow the struct updating value (default struct is immuntable)
    // Function get the last card
    mutating func getCard() -> Card{
        return cards.removeLast()
    }
    
    // mutating to allow the struct updating value (default struct is immuntable)
    // Function count the length of the card
    mutating func cardLength() -> Int {
        return cards.count
    }
}
