/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 2
 Author: Your name (e.g. Vo Quoc Huy)
 ID: Your student id (e.g. s3823236)
 Created  date: dd/mm/yyyy (e.g. 22/08/2022)
 Last modified: dd/mm/yyyy (e.g. 22/08/2022)
 */

import SwiftUI

@main
struct ChinesePoker2App: App {

    var body: some Scene {
        WindowGroup {
            // Add environment object to the highest tree
            LaunchView()
                .environmentObject(PlayerModel())
                .environmentObject(CardModel())
        }
    }
}
