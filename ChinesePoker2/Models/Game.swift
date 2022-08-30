/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 2
 Author: Your name (e.g. Vo Quoc Huy)
 ID: Your student id (e.g. s3823236)
 Created  date: dd/mm/yyyy (e.g. 23/08/2022)
 Last modified: dd/mm/yyyy (e.g. 25/08/2022)
 Acknowledgement:
 */

import Foundation


struct Game:Identifiable {
   var id = UUID()
   var players: [Player]
   var mode: String?
   var betAmount: Int?
}


