//
//  ChinesePoker2App.swift
//  ChinesePoker2
//
//  Created by Võ Quốc Huy on 22/08/2022.
//

import SwiftUI

@main
struct ChinesePoker2App: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(PlayerModel())
                .environmentObject(CardModel())
//            PlayView()
//                .environmentObject(CardModel())
        }
    }
}
