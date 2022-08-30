/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 2
 Author: Your name (e.g. Vo Quoc Huy)
 ID: Your student id (e.g. s3823236)
 Created  date: dd/mm/yyyy (e.g. 27/08/2022)
 Last modified: dd/mm/yyyy (e.g. 27/08/2022)
 Acknowledgement:
 */

import SwiftUI

struct AchievementView: View {
    // variable requires passing from other view
    var player:Player
    // declare columns to pass to lazyvgrid
    let columns = [
        GridItem(.adaptive(minimum: 100))
    ]
    // State variable to check which achievement is chosen
    @State var selectedAchievement:Achievement?
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
                            Button {
                                //playsound
                                playSound(sound: "ClickButton", type: "mp3")
                                // get that achivement
                                selectedAchievement = achievement
                            } label: {
                                VStack{
                                    Image(achievement.image).resizable().aspectRatio(contentMode: .fit).frame(width: 100, height: 100).clipShape(Circle()).shadow(color: .yellow.opacity(0.6), radius: 10)
                                    Text(achievement.name).foregroundColor(.white)
                                }
                                // Show alert message
                                .alert(item: $selectedAchievement) {
                                    achievement in
                                    Alert(title: Text("How to get?"), message: Text(achievement.description), dismissButton: .default(Text("Got it!")))
                                }
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
