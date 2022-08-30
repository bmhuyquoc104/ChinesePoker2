/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 2
 Author: Your name (e.g. Vo Quoc Huy)
 ID: Your student id (e.g. s3823236)
 Created  date: dd/mm/yyyy (e.g. 22/08/2022)
 Last modified: dd/mm/yyyy (e.g. 22/08/2022)
 Acknowledgement: https://www.youtube.com/watch?v=h25rGhYrl5I
 */

import Foundation
import SwiftUI


struct DropViewDelegate: DropDelegate{
    var  card:Card
    var models:CardModel
    var playerModel:GameModel
    
    // function to allow dropping
    func performDrop(info: DropInfo) -> Bool {
        return true
    }
    // function during the dropping occur
    func dropEntered(info: DropInfo) {
        // Get the from index from the current card that user dragging
        let fromIndex = playerModel.players[3].playerCards.firstIndex { (card) -> Bool in
            return card.id == models.currentCard?.id
        } ?? 0
        //Get the to index from the card that being dropped
        let toIndex = playerModel.players[3].playerCards.firstIndex{(card) -> Bool in
            return card.id == self.card.id
        } ?? 0
        // Switch the position of 2 cards by swapping index and updating to the game model view
        if (fromIndex != toIndex){
            withAnimation(.easeIn(duration: 1.0)){
                let fromCard = playerModel.players[3].playerCards[fromIndex]
                playerModel.players[3].playerCards[fromIndex] = playerModel.players[3].playerCards[toIndex]
                playerModel.players[3].playerCards[toIndex] = fromCard
                playSound(sound: "CardArrange", type: "mp3")
            }
        }
    }
    // Updated after droping
    func dropUpdated(info: DropInfo) -> DropProposal? {
        return DropProposal(operation: .move)
    }
}
