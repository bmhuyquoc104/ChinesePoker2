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
    init(){
        self.cards = Card.testData()
    }
}
