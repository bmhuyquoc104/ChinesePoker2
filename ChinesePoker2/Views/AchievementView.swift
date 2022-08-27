//
//  AchievementView.swift
//  ChinesePoker2
//
//  Created by Võ Quốc Huy on 27/08/2022.
//

import SwiftUI

struct AchievementView: View {
    var player:Player
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
                    Text("ACHIEVEMENTS").foregroundColor(.white).font(.title)
                    Spacer()
                }.padding(.top,30)
                VStack(spacing:10){

                Image(player.image).resizable().aspectRatio(contentMode: .fit)
                    .clipShape(Capsule()).frame(width: 150, height: 150).shadow(color: .red.opacity(0.6), radius: 10)
                    Text(player.playerName).foregroundColor(.white).padding(.top,15).font(.system(size: 20))
                    Text("$\(player.money)").foregroundColor(Color("secondary")).font(.system(size: 25))
                }
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(player.achievements, id: \.self) {
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

struct AchievementView_Previews: PreviewProvider {
    static var previews: some View {
        let player =     Player(playerName: "Huy", isBot: false, money: 70000, image: "daredevil",achievements: [
            Achievement(name: "Silver", description: "Earn $100", image: "Silver"),
            Achievement(name: "Platinum", description: "Earn $500", image: "Platinum"),
            Achievement(name: "Gold", description: "Earn $1000", image: "Gold"),
            Achievement(name: "Diamond", description: "Earn $10000", image: "Diamond"),
            Achievement(name: "Master", description: "Earn $50000", image: "Master"),
            Achievement(name: "Challenger", description: "Earn $100000", image: "Challenger"),
            Achievement(name: "", description: "1day streak", image: "1day-streak"),

        ])
        AchievementView(player: player)
    }
}