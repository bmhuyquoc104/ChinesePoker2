/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 2
 Author: Your name (e.g. Vo Quoc Huy)
 ID: Your student id (e.g. s3823236)
 Created  date: dd/mm/yyyy (e.g. 22/08/2022)
 Last modified: dd/mm/yyyy (e.g. 22/08/2022)
 */

import Foundation

class CardModel:ObservableObject {
    // Published variable to access and update in other views
    @Published var cards:[Card]
    @Published var currentCard:Card?
    @Published var frontHandValue:Int = 0
    @Published var middleHandValue:Int = 0
    @Published var backHandValue:Int = 0
    init(){
        self.cards = Card.testData()
    }
    
    // Function to evaluate the hand type and return the hand type
    func evaluateHand(cards:Stack) -> HandType{
        return HandType(cards: cards)
    }
    
    // Function to evaluate the hand type for front hand and assign the value to fronthandvalue
    func evaluateFrontHand(cards:[Card]){
        frontHandValue = evaluateHand(cards: [cards[0],cards[1],cards[2]]).rawValue
    }
    // Function to evaluate the hand type for middle hand and assign the value to middlehandvalue
    func evaluateMiddleHand(cards:[Card]){
        middleHandValue = evaluateHand(cards: [cards[0],cards[1],cards[2],cards[3],cards[4]]).rawValue
    }
    // Function to evaluate the hand type for back hand and assign the value to backhandvalue
    func evaluateBackHand(cards:[Card]){
        backHandValue = evaluateHand(cards: [cards[0],cards[1],cards[2],cards[3],cards[4]]).rawValue
    }
}
