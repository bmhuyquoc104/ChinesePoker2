//
//  Player.swift
//  ChinesePoker2
//
//  Created by Võ Quốc Huy on 23/08/2022.


import Foundation

struct Player: Identifiable {
    var playerName: String
    var id = UUID()
    var playerCards = Stack()
    var isBot = true
    var money: Int
    var image: String
    var rankFrontHand:Int?
    var rankMiddleHand:Int?
    var rankBackHand:Int?
    var achievements:[Achievement]
}

struct Achievement: Identifiable,Hashable{
    var id = UUID()
    var name:String
    var description:String
    var image:String
}


