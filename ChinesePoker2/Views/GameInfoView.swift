//
//  GameInfoView.swift
//  ChinesePoker2
//
//  Created by Võ Quốc Huy on 28/08/2022.
//

import SwiftUI

struct GameInfoView: View {
    var width:CGFloat
    var height:CGFloat
    @Binding var isToggleGameSetting:Bool
    var betAmount:Int
    var mode:String
    
    var body: some View {
        ZStack{
            Rectangle().foregroundColor(Color("Table")).clipShape(RoundedRectangle(cornerRadius: 10)).frame(width: width/7*6, height: height/2.8).shadow(color: .white, radius: 3)
            VStack (alignment:.leading){
                VStack(spacing:0){
                    HStack{
                        Button {
                            isToggleGameSetting = false
                        } label: {
                            Image(systemName: "xmark.circle").resizable().aspectRatio(contentMode: .fit).foregroundColor(Color("primary")).frame(width: 40, height: 40)
                        }.offset(x:130,y:-20)
                    }
                    Text("Game Setting").font(.title).foregroundColor(.white).offset(x:20,y:-20)
                }
                VStack(alignment:.leading,spacing:15){
                    HStack(spacing:20){
                        Text("🏆 Ranking:").foregroundColor(.white).font(.system(size: 25))
                        Text("Master").foregroundColor(Color("secondary")).font(.system(size: 25))
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
    }
}

//struct GameInfoView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameInfoView()
//    }
//}
