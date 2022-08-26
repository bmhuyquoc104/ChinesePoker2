//
//  StartView.swift
//  ChinesePoker2
//
//  Created by Võ Quốc Huy on 26/08/2022.
//

import SwiftUI

struct StartView: View {
 
    // State variable to check the current tab selection
        @State private var tabSelection = 1
        // Initializer delegation
        init() {
            // Customize the tab bar for the whole app
            UITabBar.appearance().unselectedItemTintColor = UIColor(.white)
            UITabBar.appearance().barTintColor = UIColor(Color("primary"))
        }
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
            }.accentColor(Color("primary"))
        }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
        StartView().environment(\.colorScheme, .dark)
    }
}