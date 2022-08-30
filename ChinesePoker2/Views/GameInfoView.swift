/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 2
 Author: Your name (e.g. Vo Quoc Huy)
 ID: Your student id (e.g. s3823236)
 Created  date: dd/mm/yyyy (e.g. 28/08/2022)
 Last modified: dd/mm/yyyy (e.g. 28/08/2022)
 Acknowledgement:
 */

import SwiftUI

struct GameInfoView: View {
    // Variable to get the width and height from other view
    var width:CGFloat
    var height:CGFloat
    // Binding variable to update these variables from other views
    @Binding var isToggleGameSetting:Bool
    // Environment object to get access to these variables in the view model
    @EnvironmentObject var playerModel:PlayerModel
    // Variable to get the betamount and mode from other view
    var betAmount:Int
    var mode:String
    
    var body: some View {
        ZStack{
            Rectangle().foregroundColor(Color("Table")).clipShape(RoundedRectangle(cornerRadius: 10)).frame(width: width/7*6, height: height/2.8).shadow(color: .white, radius: 3)
            VStack (alignment:.leading){
                VStack(spacing:0){
                    HStack{
                        Button {
                            // Close this view
                            isToggleGameSetting = false
                            // play sound
                            playSound(sound: "ClickButton", type: "mp3")
                        } label: {
                            Image(systemName: "xmark.circle").resizable().aspectRatio(contentMode: .fit).foregroundColor(Color("primary")).frame(width: 40, height: 40)
                        }.offset(x:130,y:-20)
                    }
                    Text("Game Setting").font(.title).foregroundColor(.white).offset(x:20,y:-20)
                }
                VStack(alignment:.leading,spacing:15){
                    HStack(spacing:20){
                        Text("🏆 Ranking:").foregroundColor(.white).font(.system(size: 25))
                        Text(playerModel.ranking ?? "Silver").foregroundColor(Color("secondary")).font(.system(size: 25))
                    }
                    HStack(spacing:20){
                        Text("💰 Bet:").foregroundColor(.white).font(.system(size: 25))
                        Text("\(betAmount)").foregroundColor(Color("secondary")).font(.system(size: 25))
                    }
                    HStack(spacing:20){
                        Text("🎮 Mode:").foregroundColor(.white).font(.system(size: 25))
                        Text(mode).foregroundColor(Color("secondary")).font(.system(size: 25))
                    }
                }
                
            }
        }
        // update achievement when the money is changing
        .onChange(of: playerModel.currentPlayer?.money, perform: { newValue in
            playerModel.updateAchivement()
        })
        .onAppear{
            playerModel.updateAchivement()
        }
    }
}

//struct GameInfoView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameInfoView()
//    }
//}
