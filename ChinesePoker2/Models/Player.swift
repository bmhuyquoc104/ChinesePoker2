/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 2
 Author: Your name (e.g. Vo Quoc Huy)
 ID: Your student id (e.g. s3823236)
 Created  date: dd/mm/yyyy (e.g. 23/08/2022)
 Last modified: dd/mm/yyyy (e.g. 28/08/2022)
 Acknowledgement:
 */


import Foundation

// codable to allow encode and decode variable to the userdefault data
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
    // coding keys to restrict the variable that will be use for decoding
    private enum CodingKeys: String, CodingKey {
            case playerName, id,money,image,isBot,achievements
    }
}

// codable to allow encode and decode variable to the userdefault data, hashable for load by for each
struct Achievement: Identifiable,Hashable,Codable{
    var id = UUID()
    var name:String
    var description:String
    var image:String
}


