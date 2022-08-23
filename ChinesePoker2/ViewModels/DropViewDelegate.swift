//
//  DropViewDelegate.swift
//  ChinesePoker2
//
//  Created by Võ Quốc Huy on 22/08/2022.
//

import Foundation
import SwiftUI

struct DropViewDelegate: DropDelegate{
    var  card:Card
    var models:CardModel
  
    
    func performDrop(info: DropInfo) -> Bool {
        return true
    }
    func dropEntered(info: DropInfo) {
      

//        if let middle = middleCards {
//            models.evaluateMiddleHand(card1: middle[0]  , card2: middle[1], card3: middle[2],card4: middle[3],card5: middle[4])
//        }
//        if let back = backCards {
//            models.evaluateBackHand(card1: back[0]  , card2: back[1], card3: back[2],card4: back[3],card5: back[4])
//        }
        let fromIndex = models.cards.firstIndex { (card) -> Bool in
            return card.id == models.currentCard?.id
        } ?? 0
        let toIndex = models.cards.firstIndex{(card) -> Bool in
            return card.id == self.card.id
        } ?? 0
        if (fromIndex != toIndex){
            withAnimation(.easeIn(duration: 3.0)){
                let fromCard = models.cards[fromIndex]
                models.cards[fromIndex] = models.cards[toIndex]
                models.cards[toIndex] = fromCard
            }
        }
    }
    func dropUpdated(info: DropInfo) -> DropProposal? {
        return DropProposal(operation: .move)
    }
}
