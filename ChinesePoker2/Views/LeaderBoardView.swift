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
import AVFoundation


struct LeaderBoardView: View {
    // Environment object to get access to these variables in the view model
    @EnvironmentObject var playerModel: PlayerModel
    // State variable to detect and show by condition
    @State var selectedPlayer:Player?
    var body: some View {
        GeometryReader{
            geo in
            ScrollView{
                VStack{
                    HStack{
                        Spacer()
                        Text("LEADERBOARD").foregroundColor(.white).font(.title).padding(.top,30
                        )
                        Spacer()
                    }
                    VStack{
                        HStack(spacing:25){
                            Button {
                                playSound(sound: "ClickButton", type: "mp3")
                                selectedPlayer = playerModel.realPlayers[1]
                            } label: {
                                VStack{
                                    
                                    Image(playerModel.realPlayers[1].image).resizable().aspectRatio(contentMode: .fit)
                                        .clipShape(Capsule()).frame(width: 80, height: 80).shadow(color: .yellow.opacity(0.6), radius: 10)
                                    Text(playerModel.realPlayers[1].playerName).foregroundColor(.white)
                                    Text("$\(playerModel.realPlayers[1].money)").foregroundColor(Color("secondary"))
                                }.offset(y:75)
                            }
                            .sheet(item: $selectedPlayer) {
                                player in
                                AchievementView(player: player)
                            }
                            Button {
                                playSound(sound: "ClickButton", type: "mp3")
                                selectedPlayer = playerModel.realPlayers[0]
                            } label: {
                                VStack{
                                    Text("????").font(.system(size: 40)).offset(y:20)
                                    Image(playerModel.realPlayers[0].image).resizable().aspectRatio(contentMode: .fit)
                                        .clipShape(Capsule()).frame(width: 110, height: 110).shadow(color: .red.opacity(0.6), radius: 10)
                                    Text(playerModel.realPlayers[0].playerName).foregroundColor(.white)
                                    Text("$\(playerModel.realPlayers[0].money)").foregroundColor(Color("primary"))
                                    
                                }
                            } .sheet(item: $selectedPlayer) {
                                player in
                                AchievementView(player: player)
                            }
                            Button {
                                playSound(sound: "ClickButton", type: "mp3")
                                selectedPlayer = playerModel.realPlayers[2]
                            } label: {
                                VStack{
                                    Image(playerModel.realPlayers[2].image).resizable().aspectRatio(contentMode: .fit)
                                        .clipShape(Capsule()).frame(width: 75, height: 75).shadow(color: .green.opacity(0.6), radius: 10)
                                    Text(playerModel.realPlayers[2].playerName).foregroundColor(.white)
                                    Text("$\(playerModel.realPlayers[2].money)").foregroundColor(.green)
                                    
                                }.offset(y:80)
                            }
                            .sheet(item: $selectedPlayer) {
                                player in
                                AchievementView(player: player)
                            }
                        }
                    }.padding(.bottom,60)
                    LazyVStack(spacing:25){
                        ForEach(3..<playerModel.realPlayers.count,id:\.self){
                            index in
                            Button {
                                playSound(sound: "ClickButton", type: "mp3")
                                selectedPlayer = playerModel.realPlayers[index]
                            } label: {
                                HStack{
                                    Text("\(index+1)").foregroundColor(.white).offset(x:10,y:5)
                                    HStack(spacing:20){
                                        Image(playerModel.realPlayers[index].image).resizable().aspectRatio(contentMode: .fit).frame(width: 50, height: 50)
                                        Text(playerModel.realPlayers[index].playerName).foregroundColor(.white)
                                        Spacer()
                                        Text("$\(playerModel.realPlayers[index].money)").foregroundColor(Color("secondary")).padding(.trailing,35)
                                    }.background(Color("ButtonBackground"))                    .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous)).padding(.horizontal)
                                }.padding(.horizontal)
                            }
                            .sheet(item: $selectedPlayer) {
                                player in
                                AchievementView(player: player)
                            }
                        }
                    }
                }
            }.background(Color("Background"))
        } .onAppear(perform: {
            playerModel.findTopThree()
        })
    }
}

struct LeaderBoardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderBoardView().environmentObject(PlayerModel())
        LeaderBoardView().environment(\.colorScheme, .dark)
    }
}
