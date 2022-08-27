//
//  ChinesePokerGame.swift
//  ChinesePoker2
//
//  Created by Võ Quốc Huy on 23/08/2022.
//

import Foundation

struct Game:Identifiable {
   var id = UUID()
   var players: [Player]
   var mode: String?
   var betAmount: Int?
}


