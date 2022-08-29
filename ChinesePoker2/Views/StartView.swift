//
//  StartView.swift
//  ChinesePoker2
//
//  Created by Võ Quốc Huy on 26/08/2022.
//

import SwiftUI

struct StartView: View {
    @StateObject var gameModel = GameModel()
    @EnvironmentObject var playerModel:PlayerModel
    // State variable to check the current tab selection
    @State private var tabSelection = 1
    // Initializer delegation
    
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
