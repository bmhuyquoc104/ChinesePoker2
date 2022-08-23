//
//  MainView.swift
//  ChinesePoker2
//
//  Created by Võ Quốc Huy on 23/08/2022.
//

import SwiftUI


struct MainView: View {
    @EnvironmentObject var model:ChinesePokerGameModel
    let columns = [
        GridItem(.adaptive(minimum: 90),spacing:-75)
    ]
    var body: some View {
        
        GeometryReader {
            geo in
            VStack {
                Spacer()
                ZStack {
                    ZStack(alignment:.center){
                        Rectangle().foregroundColor(Color("BorderTable")).cornerRadius(100).frame(width: geo.size.width/5*4, height: geo.size.height/5*4.6)
                            .shadow(color: .black, radius: 15)
                        Rectangle().foregroundColor(Color("Table")).cornerRadius(100).frame(width: geo.size.width/5*3.5, height: geo.size.height/5*4.3)
                    }
                    VStack(){
                        VStack {
                            ZStack(alignment:.bottomTrailing){
                                Rectangle().foregroundColor(Color("Table")).frame(width: geo.size.width/7*2.2, height: geo.size.height/16).clipShape(Capsule())
                                    .opacity(0.8)
                                HStack(){
                                    VStack{
                                        Text(model.players[0].playerName).foregroundColor(.red).font(.system(size: 13))
                                        if let score = model.players[0].score{
                                            Text("$\(score)").foregroundColor(.yellow).font(.system(size: 13))
                                        }
                                    }
                                    Image(model.players[0].image!).resizable().aspectRatio(contentMode: .fit)
                                        .frame(width: .infinity, height: geo.size.height/16)
                                        .clipShape(Circle())
                                }
                            }
                            VStack(alignment:.leading,spacing:-10){
                                HStack(spacing:-10){
                                    Image("card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 30, height: 40)
                                    Image("card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 30, height: 40)
                                    Image("card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 30, height: 40)
                                }
                                HStack(spacing:-10){
                                    Image("card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 30, height: 40)
                                    Image("card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 30, height: 40)
                                    Image("card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 30, height: 40)
                                    Image("card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 30, height: 40)
                                    Image("card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 30, height: 40)
                                }
                                HStack(spacing:-10){
                                    Image("card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 30, height: 40)
                                    Image("card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 30, height: 40)
                                    Image("card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 30, height: 40)
                                    Image("card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 30, height: 40)
                                    Image("card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 30, height: 40)
                                }
                            }
                            
                        }
                        Spacer()
                        VStack() {
                            LazyVGrid(columns:columns){
                                ForEach(model.players[0].playerCards){
                                    card in
                                    Image(card.image).resizable().aspectRatio(contentMode: .fit).frame(width: 50, height: 60)
                                }
                            }.frame(width:geo.size.width,height:geo.size.height/6)
                                .offset(x:55,y:10)
                            
                            
                            
                            ZStack(alignment:.bottomTrailing){
                                Rectangle().foregroundColor(Color("Table")).frame(width: geo.size.width/7*2.2, height: geo.size.height/16).clipShape(Capsule())
                                    .opacity(0.8)
                                HStack(){
                                    VStack{
                                        Text(model.players[0].playerName).foregroundColor(.red).font(.system(size: 13))
                                        if let score = model.players[0].score{
                                            Text("$\(score)").foregroundColor(.yellow).font(.system(size: 13))
                                        }
                                    }
                                    Image(model.players[0].image!).resizable().aspectRatio(contentMode: .fit)
                                        .frame(width: .infinity, height: geo.size.height/16)
                                        .clipShape(Circle())
                                }
                            }
                        }
                    }.padding(.vertical,40)
                    HStack{
                        VStack {
                            ZStack(alignment:.bottomTrailing){
                                Rectangle().foregroundColor(Color("Table")).frame(width: geo.size.width/7*2.2, height: geo.size.height/16).clipShape(Capsule())
                                    .opacity(0.8)
                                HStack(){
                                    VStack{
                                        Text(model.players[0].playerName).foregroundColor(.red).font(.system(size: 13))
                                        if let score = model.players[0].score{
                                            Text("$\(score)").foregroundColor(.yellow).font(.system(size: 13))
                                        }
                                    }
                                    Image(model.players[0].image!).resizable().aspectRatio(contentMode: .fit)
                                        .frame(width: .infinity, height: geo.size.height/16)
                                        .clipShape(Circle())
                                }
                            }
                            VStack(alignment:.leading,spacing:-10){
                                HStack(spacing:-10){
                                    Image("card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 30, height: 40)
                                    Image("card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 30, height: 40)
                                    Image("card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 30, height: 40)
                                }
                                HStack(spacing:-10){
                                    Image("card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 30, height: 40)
                                    Image("card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 30, height: 40)
                                    Image("card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 30, height: 40)
                                    Image("card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 30, height: 40)
                                    Image("card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 30, height: 40)
                                }
                                HStack(spacing:-10){
                                    Image("card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 30, height: 40)
                                    Image("card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 30, height: 40)
                                    Image("card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 30, height: 40)
                                    Image("card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 30, height: 40)
                                    Image("card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 30, height: 40)
                                }
                            }
                            
                        }.offset(y:-40)
                        
                        Spacer()
                        VStack {
                            ZStack(alignment:.bottomTrailing){
                                Rectangle().foregroundColor(Color("Table")).frame(width: geo.size.width/7*2.2, height: geo.size.height/16).clipShape(Capsule())
                                    .opacity(0.8)
                                HStack(){
                                    VStack{
                                        Text(model.players[0].playerName).foregroundColor(.red).font(.system(size: 13))
                                        if let score = model.players[0].score{
                                            Text("$\(score)").foregroundColor(.yellow).font(.system(size: 13))
                                        }
                                    }
                                    Image(model.players[0].image!).resizable().aspectRatio(contentMode: .fit)
                                        .frame(width: .infinity, height: geo.size.height/16)
                                        .clipShape(Circle())
                                }
                            }
                            VStack(alignment:.leading,spacing:-10){
                                HStack(spacing:-10){
                                    Image("card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 30, height: 40)
                                    Image("card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 30, height: 40)
                                    Image("card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 30, height: 40)
                                }
                                HStack(spacing:-10){
                                    Image("card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 30, height: 40)
                                    Image("card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 30, height: 40)
                                    Image("card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 30, height: 40)
                                    Image("card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 30, height: 40)
                                    Image("card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 30, height: 40)
                                }
                                HStack(spacing:-10){
                                    Image("card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 30, height: 40)
                                    Image("card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 30, height: 40)
                                    Image("card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 30, height: 40)
                                    Image("card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 30, height: 40)
                                    Image("card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 30, height: 40)
                                }
                            }
                            
                        }.offset(y:-40)
                    }.padding()
                }
                Spacer()
                
            }.background(Color("Background")).ignoresSafeArea()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            MainView().environmentObject(ChinesePokerGameModel())
                .environment(\.colorScheme,.dark)
            
        }
    }
}
