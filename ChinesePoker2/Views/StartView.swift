/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 2
 Author: Your name (e.g. Vo Quoc Huy)
 ID: Your student id (e.g. s3823236)
 Created  date: dd/mm/yyyy (e.g. 26/08/2022)
 Last modified: dd/mm/yyyy (e.g. 26/08/2022)
 Acknowledgement:
 */

import SwiftUI

struct StartView: View {
    @StateObject var gameModel = GameModel()
    // Environment object to get access to these variables in the view model
    @EnvironmentObject var playerModel:PlayerModel
    // State variable to check the current tab selection
    @State private var tabSelection = 1
    // Variable requires passing from other view
    var name:String
    var body: some View {
        // Create tabview for display purposes
        TabView(selection:$tabSelection){
            //  Main feature character view
            HomeView().tabItem {
                VStack{
                    Image(systemName: "house.circle")
                        .resizable()
                    Text("Home")
                }
            }.tag(1)
            //  Comics display by list
            PlayerProfileView().tabItem {
                VStack{
                    Image(systemName: "person.circle").foregroundColor(.red)
                    Text("Profile")
                    
                }
            }.tag(2)
            // BookStore display by list
            LeaderBoardView().tabItem {
                VStack{
                    Image(systemName:"dollarsign.circle")
                    Text("Top Player")
                }
            }.tag(3)
        }.accentColor(Color("secondary"))
            .onAppear(perform: {
                gameModel.createPlayers(currentPlayer: playerModel.currentPlayer!)
            })
            .environmentObject(gameModel)
        
    }
}

//struct StartView_Previews: PreviewProvider {
//    static var previews: some View {
//        StartView().environmentObject(GameModel())
//
//        StartView().environment(\.colorScheme, .dark)
//    }
//}
