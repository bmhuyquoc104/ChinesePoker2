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

struct GameOverView: View {
    // Environment object to get access to these variables in the view model
    @EnvironmentObject var gameModel:GameModel
    @EnvironmentObject var playerModel:PlayerModel
    // Environment to control the presentation mode (sheet or fullscreen over)
    @Environment(\.presentationMode) var presentationMode
    // Variables required passing from other views
    var frontHandProfit: Int
    var middleHandProfit:Int
    var backHandProfit:Int
    var width:CGFloat
    var height:CGFloat
    var money:Int
    // Binding variable to update these variables from other views
    @Binding var isShowGameOver:Bool
    @Binding var isShowMode:Bool

    
    var body: some View {
        VStack{
            // declare and assign variable total profit
            let totalProfit = frontHandProfit + middleHandProfit + backHandProfit
            ZStack{
                Rectangle().foregroundColor(.white).clipShape(RoundedRectangle(cornerRadius: 10)).frame(width: width/10*9.5, height: height/2.5).shadow(color: .white, radius: 3)
                VStack (spacing:20){
                    HStack{
                        Spacer()
                        Text(totalProfit > 0 ? "Congratulations" :"Game Over").font(.title).foregroundColor(.red).bold()
                        Spacer()
                    }
                    
                    VStack(spacing:15){
                        HStack{
                            Text(totalProfit >= 0 ? "You have won" :"You have lost").foregroundColor(.black).font(.system(size: 20)).bold()
                            Text("$\(totalProfit)").foregroundColor(totalProfit >= 0 ? Color("secondary") : Color("primary")).font(.system(size: 20)).bold()
                        }
                        HStack{
                            Text("Current Balance").foregroundColor(.black).font(.system(size: 20)).bold()
                            Text("$\(money)").foregroundColor( Color("secondary")).font(.system(size: 20)).bold()
                        }
                        // if player money <= -> sohw message that their will get back free money
                        if money <= 0 {
                            Text("Don't worry! We will give you back $5000. Good luck this time!").foregroundColor(.black).font(.system(size: 20)).bold().padding()
                        }
                    }
                   
                    HStack{
                        Button {
                            // playsound
                            playSound(sound: "ClickButton", type: "mp3")
                            // close full screen cover
                            presentationMode.wrappedValue.dismiss()
                            // close choose mode
                            isShowMode = false
                            // create new game
                            gameModel.createPlayers(currentPlayer: playerModel.currentPlayer!)
                        } label: {
                            ZStack {
                                Rectangle().foregroundColor(Color("secondary")).clipShape(RoundedRectangle(cornerRadius: 10)).frame(width: width/2.5, height: height/12).shadow(color: .white, radius: 3)
                                Text("BACK HOME").foregroundColor(.white).font(.system(size: 23)).bold()
                            }
                        }
                        Button {
                            // play sound
                            playSound(sound: "ClickButton", type: "mp3")
                            // close full screen cover
                            presentationMode.wrappedValue.dismiss()
                            // close this view
                            isShowGameOver = false
                            // create new games
                            gameModel.createPlayers(currentPlayer: playerModel.currentPlayer!)
                        } label: {
                            ZStack {
                                Rectangle().foregroundColor(Color("primary")).clipShape(RoundedRectangle(cornerRadius: 10)).frame(width: width/2.5, height: height/12).shadow(color: .white, radius: 3)
                                Text("NEW GAME").foregroundColor(.white).font(.system(size: 23)).bold()
                            }
                        }
                    }
                    
                }
            }.onAppear {
                // Load the approriate sound depend on winning or losing
                if totalProfit >= 0 {
                    playSound(sound: "Victory", type: "mp3")
                }
                else{
                    playSound(sound: "LoseGame", type: "mp3")
                }
            }
        }
    }
}

//struct GameOverView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameOverView()
//    }
//}
