//
//  BackHomeView.swift
//  ChinesePoker2
//
//  Created by Võ Quốc Huy on 28/08/2022.
//

import SwiftUI

struct BackHomeView: View {
    @Binding var isToggleHomeButton:Bool
    @Binding var isShowMode:Bool

    var width:CGFloat
    var height:CGFloat
    @Environment(\.presentationMode) var presentationMode
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
                            playSound(sound: "ClickButton", type: "mp3")
                            isShowMode = false
                            gameModel.createPlayers(currentPlayer: playerModel.currentPlayer!)
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
