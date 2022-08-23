//
//  ProfileView.swift
//  ChinesePoker2
//
//  Created by Võ Quốc Huy on 24/08/2022.
//

import SwiftUI

struct ProfileView: View {
    var player: Player
    var body: some View {
        
        GeometryReader {
            geo in
            HStack(){
                        VStack{
                            Text(player.playerName).foregroundColor(.red)
                            if let score = player.score{
                                Text("$ \(score)").foregroundColor(.yellow)
                            }
                        }
                Image(player.image!).resizable().aspectRatio(contentMode: .fit)
                    .frame(width: geo.size.width/5, height: geo.size.height/10)
            }
        }
                
         
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        let player = Player(playerName: "huy", playerCards: Card.testData(), isBot: false, score: 2000,image: "avatar2")
        ProfileView(player: player)
            .environment(\.colorScheme, .dark)
    }
}
