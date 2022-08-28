//
//  PlayerProfileView.swift
//  ChinesePoker2
//
//  Created by Võ Quốc Huy on 26/08/2022.
//

import SwiftUI

struct PlayerProfileView: View {
    @EnvironmentObject var playerModel:PlayerModel
    let columns = [
        GridItem(.adaptive(minimum: 100))
    ]
    var body: some View {
        GeometryReader {
            geo in
            VStack(spacing:30){
                Spacer()
                HStack{
                    Spacer()
                    Text("Player Profile").foregroundColor(.white).font(.title)
                    Spacer()
                }.padding(.top,30)
                VStack(spacing:10){

                Image(playerModel.currentPlayer!.image).resizable().aspectRatio(contentMode: .fit)
                    .clipShape(Capsule()).frame(width: 150, height: 150).shadow(color: .red.opacity(0.6), radius: 10)
                    Text(playerModel.currentPlayer!.playerName).foregroundColor(.white).padding(.top,15).font(.system(size: 20))
                    Text("$\(playerModel.currentPlayer!.money)").foregroundColor(Color("secondary")).font(.system(size: 25))
                }
                Text("Your achievements: ").foregroundColor(Color("primary")).font(.system(size: 25))
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(playerModel.currentPlayer!.achievements, id: \.self) {
                            achievement in
                            VStack{
                                Image(achievement.image).resizable().aspectRatio(contentMode: .fit).frame(width: 100, height: 100).clipShape(Circle()).shadow(color: .yellow.opacity(0.6), radius: 10)
                                Text(achievement.name).foregroundColor(.white)
                            }
                        }
                    }
                }
                Spacer()
            }
            .padding(.horizontal)
        }.background(Color("Background"))
    }
}

struct PlayerProfileView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerProfileView().environmentObject(PlayerModel())
    }
}
