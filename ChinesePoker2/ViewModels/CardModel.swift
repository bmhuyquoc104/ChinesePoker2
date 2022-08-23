//
//  CardModel.swift
//  ChinesePoker2
//
//  Created by Võ Quốc Huy on 22/08/2022.
//

import Foundation

class CardModel:ObservableObject {
    @Published var cards:[Card]
    @Published var currentCard:Card?
    @Published var frontHandValue:Int = 0
    @Published var middleHandValue:Int = 0
    @Published var backHandValue:Int = 0
    init(){
        self.cards = Card.testData()
    }
    
    func evaluateHand(cards:Stack) -> HandType{
        return HandType(cards: cards)
    }
    
    func evaluateFrontHand(cards:[Card]){
        frontHandValue = evaluateHand(cards: [cards[0],cards[1],cards[2]]).rawValue
    }
    func evaluateMiddleHand(cards:[Card]){
        middleHandValue = evaluateHand(cards: [cards[0],cards[1],cards[2],cards[3],cards[4]]).rawValue
    }
    func evaluateBackHand(cards:[Card]){
        backHandValue = evaluateHand(cards: [cards[0],cards[1],cards[2],cards[3],cards[4]]).rawValue
    }
}
