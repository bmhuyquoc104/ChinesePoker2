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

struct BackHomeView: View {
    // Binding variable to update these variables from other views.
    @Binding var isToggleHomeButton:Bool
    @Binding var isShowMode:Bool
    // Variable to get the width and height from other view
    var width:CGFloat
    var height:CGFloat
    // Environment to control the presentation mode (sheet or fullscreen over)
    @Environment(\.presentationMode) var presentationMode
    // Environment object to get access to these variables in the view model
    @EnvironmentObject var gameModel:GameModel
    @EnvironmentObject var playerModel:PlayerModel
    var body: some View {
        ZStack{
            Rectangle().foregroundColor(Color("Table")).clipShape(RoundedRectangle(cornerRadius: 10)).frame(width: width/7*6, height: height/2.8).shadow(color: .white, radius: 3)
            VStack (){
                Text("Are you sure to back to the menu ?").font(.title).foregroundColor(.white).bold()
                VStack(spacing:0){
                    HStack(spacing:100){
                        Button {
                            playSound(sound: "ClickButton", type: "mp3")
                            isToggleHomeButton = false
                        } label: {
                            Image(systemName: "xmark.circle").resizable().aspectRatio(contentMode: .fit).foregroundColor(Color("primary")).frame(width: 40, height: 40)
                        }
                        Button {
                            // play sound
                            playSound(sound: "ClickButton", type: "mp3")
                            // close choose mode view
                            isShowMode = false
                            // create new players in case the user want to play again
                            gameModel.createPlayers(currentPlayer: playerModel.currentPlayer!)
                            // dismiss the full screen cover and back to menu
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "checkmark.circle").resizable().aspectRatio(contentMode: .fit).foregroundColor(Color("secondary")).frame(width: 40, height: 40)
                        }
                    }
                
                }
                
            }
        }
        
    }
}

struct BackHomeView_Previews: PreviewProvider {
    static var previews: some View {
        BackHomeView(isToggleHomeButton: .constant(true),isShowMode:.constant(true),width: 400,height: 400)
            .environmentObject(GameModel())
    }
}
