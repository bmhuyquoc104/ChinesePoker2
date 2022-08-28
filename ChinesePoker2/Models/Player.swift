//
//  Player.swift
//  ChinesePoker2
//
//  Created by Võ Quốc Huy on 23/08/2022.


import Foundation

struct Player: Identifiable,Codable {
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
    private enum CodingKeys: String, CodingKey {
            case playerName, id,money,image,isBot,achievements
    }
}

struct Achievement: Identifiable,Hashable,Codable{
    var id = UUID()
    var name:String
    var description:String
    var image:String
}


