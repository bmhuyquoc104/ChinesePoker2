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
