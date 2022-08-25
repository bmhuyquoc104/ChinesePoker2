//
//  CompareDeck.swift
//  ChinesePoker2
//
//  Created by Võ Quốc Huy on 25/08/2022.
//

import Foundation

struct compareDeck{
    static func rankHand(arr:[Hand],type:String) {
        switch arr[0].name{
        case "bot1":
            if (type == "FrontHand"){
                playerBot1!.rankFrontHand = 4
            }
            if (type == "MiddleHand"){
                playerBot1!.rankMiddleHand = 4
            }
            if (type == "BackHand"){
                playerBot1!.rankBackHand = 4
            }
        case "bot2":
            if (type == "FrontHand"){
                playerBot2!.rankFrontHand = 4
            }
            if (type == "MiddleHand"){
                playerBot2!.rankMiddleHand = 4
            }
            if (type == "BackHand"){
                playerBot2!.rankBackHand = 4
            }
        case "bot3":
            if (type == "FrontHand"){
                playerBot3!.rankFrontHand = 4
            }
            if (type == "MiddleHand"){
                playerBot3!.rankMiddleHand = 4
            }
            if (type == "BackHand"){
                playerBot3!.rankBackHand = 4
            }
        case "player":
            if (type == "FrontHand"){
                myPlayer!.rankFrontHand = 4
            }
            if (type == "MiddleHand"){
                myPlayer!.rankMiddleHand = 4
            }
            if (type == "BackHand"){
                myPlayer!.rankBackHand = 4
            }
        default:
            return
        }
    }
}
