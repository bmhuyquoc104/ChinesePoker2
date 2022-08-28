//
//  GameOverView.swift
//  ChinesePoker2
//
//  Created by Võ Quốc Huy on 28/08/2022.
//

import SwiftUI

struct GameOverView: View {
    @EnvironmentObject var gameModel:GameModel
    @Environment(\.presentationMode) var presentationMode

    var frontHandProfit: Int
    var middleHandProfit:Int
    var backHandProfit:Int
    var width:CGFloat
    var height:CGFloat
    var money:Int
    @Binding var isShowGameOver:Bool
    @Binding var isShowMode:Bool

    
    var body: some View {
        VStack{
            let totalProfit = frontHandProfit + middleHandProfit + backHandProfit
            ZStack{
                Rectangle().foregroundColor(.white).clipShape(RoundedRectangle(cornerRadius: 10)).frame(width: width/10*9.5, height: height/2.8).shadow(color: .white, radius: 3)
                VStack (spacing:20){
                    HStack{
                        Spacer()
                        Text(totalProfit > 0 ? "Congratulations" :"Game Over").font(.title).foregroundColor(.red).bold()
                        Spacer()
                    }
                    
                    VStack(spacing:15){
                        HStack{
                            Text(totalProfit > 0 ? "You have won" :"You have lost").foregroundColor(.black).font(.system(size: 20)).bold()
                            Text("$\(totalProfit)").foregroundColor(totalProfit > 0 ? Color("secondary") : Color("primary")).font(.system(size: 20)).bold()
                        }
                        HStack{
                            Text("Current Balance").foregroundColor(.black).font(.system(size: 20)).bold()
                            Text("$\(money)").foregroundColor( Color("secondary")).font(.system(size: 20)).bold()
                        }
                    }
                   
                    HStack{
                        Button {
                            playSound(sound: "ClickButton", type: "mp3")
                            presentationMode.wrappedValue.dismiss()
                            isShowMode = false
                            gameModel.createPlayers()
                        } label: {
                            ZStack {
                                Rectangle().foregroundColor(Color("secondary")).clipShape(RoundedRectangle(cornerRadius: 10)).frame(width: width/2.5, height: height/12).shadow(color: .white, radius: 3)
                                Text("BACK HOME").foregroundColor(.white).font(.system(size: 23)).bold()
                            }
                        }
                        Button {
                            playSound(sound: "ClickButton", type: "mp3")
                            presentationMode.wrappedValue.dismiss()
                            isShowGameOver = false
                            gameModel.createPlayers()
                        } label: {
                            ZStack {
                                Rectangle().foregroundColor(Color("primary")).clipShape(RoundedRectangle(cornerRadius: 10)).frame(width: width/2.5, height: height/12).shadow(color: .white, radius: 3)
                                Text("NEW GAME").foregroundColor(.white).font(.system(size: 23)).bold()
                            }
                        }
                    }
                    
                }
            }.onAppear {
                if totalProfit > 0 {
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
