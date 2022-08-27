//
//  MainView.swift
//  ChinesePoker2
//
//  Created by Võ Quốc Huy on 23/08/2022.
//

import SwiftUI
import AVFoundation

struct MainView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var model:GameModel
    @EnvironmentObject var cardModel:CardModel
    @State private var showFrontHand: Bool = false
    @State private var isShowCompare: Bool = false
    @State private var isShowArrange:Bool = true
    
    @State var showMiddleHand = false
    @State var showBackHand = false
    @State var frontHandBotHand1 = 0
    @State var frontHandBotHand2 = 0
    @State var frontHandBotHand3 = 0
    
    @State var middleHandBotHand1 = 0
    @State var middleHandBotHand2 = 0
    @State var middleHandBotHand3 = 0
    
    @State var backHandBotHand1 = 0
    @State var backHandBotHand2 = 0
    @State var backHandBotHand3 = 0
    
    @State var botHand1 = Stack()
    @State var botHand2 = Stack()
    @State var botHand3 = Stack()
    
    @State var frontHandPlayer = 0
    @State var middleHandPlayer = 0
    @State var backHandPlayer = 0
    @State private var isShowFrontHandResult:Bool = false
    @State var isShowMiddleHandResult = false
    @State var isShowBackHandResult = false

    // State variable to check if the button status
    @State var isTogglePreview = false
    
    let columns = [
        GridItem(.adaptive(minimum: 90),spacing:-75)
    ]
    var body: some View {
        
        GeometryReader {
            geo in
            ZStack {
                
                VStack {
                    Spacer()
                    ZStack {
                        ZStack(alignment:.center){
                            Rectangle().foregroundColor(Color("BorderTable")).cornerRadius(100).frame(width: geo.size.width/5*4, height: geo.size.height/5*4.6)
                                .shadow(color: .black, radius: 15)
                            Rectangle().foregroundColor(Color("Table")).cornerRadius(100).frame(width: geo.size.width/5*3.5, height: geo.size.height/5*4.3)
                        }
                        if (isShowFrontHandResult){
    //                        if let rankExist = model.players[0].rank{
    //                            Text(rankExist)
    //                        }
                        }
                        VStack(){
                            // MARK: BOT1
                            VStack {
                                ZStack(alignment:.bottomLeading){
                                    Rectangle().foregroundColor(Color("Table")).frame(width: geo.size.width/7*2.2, height: geo.size.height/16).clipShape(Capsule())
                                        .opacity(0.8)
                                    HStack(){
                                        
                                        Image(model.players[0].image).resizable().aspectRatio(contentMode: .fit)
                                            .frame(width: geo.size.width/8, height: geo.size.height/16)
                                            .clipShape(Circle())
                                        VStack{
                                            Text(model.players[0].playerName).foregroundColor(.red).font(.system(size: 13))
                                            if let score = model.players[0].money{
                                                Text("$\(score)").foregroundColor(.yellow).font(.system(size: 13))
                                            }
                                        }
                                    }
                                }
                                VStack(alignment:.leading,spacing:-10){
                                    HStack(spacing:-30){
                                        Image(showFrontHand ? botHand1[0].image : "card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 60, height: 60).animation( .easeInOut, value: showFrontHand)
                                        Image(showFrontHand ? botHand1[1].image : "card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 60, height: 60).animation( .easeInOut, value: showFrontHand)
                                        Image(showFrontHand ? botHand1[2].image : "card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 60).animation( .easeInOut, value: showFrontHand)
                                    }
                                    HStack(spacing:-30){
                                        Image(showMiddleHand ? botHand1[3].image : "card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 60, height: 60).animation( .easeInOut, value: showFrontHand)
                                        Image(showMiddleHand ? botHand1[4].image : "card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 60, height: 60).animation( .easeInOut, value: showFrontHand)
                                        Image(showMiddleHand ? botHand1[5].image : "card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 60, height: 60).animation( .easeInOut, value: showFrontHand)
                                        Image(showMiddleHand ? botHand1[6].image : "card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 60, height: 60).animation( .easeInOut, value: showFrontHand)
                                        Image(showMiddleHand ? botHand1[7].image : "card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 60, height: 60).animation( .easeInOut, value: showFrontHand)
                                    }
                                    HStack(spacing:-30){
                                        Image(showBackHand ? botHand1[8].image : "card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 60, height: 60).animation( .easeInOut, value: showFrontHand)
                                        Image(showBackHand ? botHand1[9].image : "card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 60, height: 60).animation( .easeInOut, value: showFrontHand)
                                        Image(showBackHand ? botHand1[10].image : "card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 60, height: 60).animation( .easeInOut, value: showFrontHand)
                                        Image(showBackHand ? botHand1[11].image : "card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 60, height: 60).animation( .easeInOut, value: showFrontHand)
                                        Image(showBackHand ? botHand1[12].image : "card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 60, height: 60).animation( .easeInOut, value: showFrontHand)
                                    }
                                }
                                VStack{
                                    if (isShowFrontHandResult){
                                        Text("\((model.playerBot1?.rankFrontHand ?? 0)*100)")
                                    }
                                    if isShowMiddleHandResult{
                                        Text("\((model.playerBot1?.rankMiddleHand ?? 0)*100)")
                                    }
                                    if isShowBackHandResult{
                                        Text("\((model.playerBot1?.rankBackHand ?? 0)*100)")
                                    }
                                }
                            }
                            Spacer()
                            // MARK: PLAYER
                            VStack() {
                                VStack{
                                    if (isShowFrontHandResult){
                                        Text("\((model.myPlayer?.rankFrontHand ?? 0)*100)")
                                    }
                                    if isShowMiddleHandResult{
                                        Text("\((model.myPlayer?.rankMiddleHand ?? 0)*100)")
                                    }
                                    if isShowBackHandResult{
                                        Text("\((model.myPlayer?.rankBackHand ?? 0)*100)")
                                    }
                                }
                                VStack(alignment:.leading,spacing:-10){
                                    HStack(spacing:-30){
                                        Image(showFrontHand ? model.players[3].playerCards[0].image : "card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 60, height: 60).animation( .easeInOut, value: showFrontHand)
                                        Image(showFrontHand ? model.players[3].playerCards[1].image : "card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 60, height: 60).animation( .easeInOut, value: showFrontHand)
                                        Image(showFrontHand ? model.players[3].playerCards[2].image : "card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 60).animation( .easeInOut, value: showFrontHand)
                                    }
                                    HStack(spacing:-30){
                                        Image(showMiddleHand ? model.players[3].playerCards[3].image : "card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 60, height: 60).animation( .easeInOut, value: showFrontHand)
                                        Image(showMiddleHand ? model.players[3].playerCards[4].image : "card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 60, height: 60).animation( .easeInOut, value: showFrontHand)
                                        Image(showMiddleHand ? model.players[3].playerCards[5].image : "card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 60, height: 60).animation( .easeInOut, value: showFrontHand)
                                        Image(showMiddleHand ? model.players[3].playerCards[6].image : "card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 60, height: 60).animation( .easeInOut, value: showFrontHand)
                                        Image(showMiddleHand ? model.players[3].playerCards[7].image : "card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 60, height: 60).animation( .easeInOut, value: showFrontHand)
                                    }
                                    HStack(spacing:-30){
                                        Image(showBackHand ? model.players[3].playerCards[8].image : "card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 60, height: 60).animation( .easeInOut, value: showFrontHand)
                                        Image(showBackHand ? model.players[3].playerCards[9].image : "card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 60, height: 60).animation( .easeInOut, value: showFrontHand)
                                        Image(showBackHand ? model.players[3].playerCards[10].image : "card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 60, height: 60).animation( .easeInOut, value: showFrontHand)
                                        Image(showBackHand ? model.players[3].playerCards[11].image : "card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 60, height: 60).animation( .easeInOut, value: showFrontHand)
                                        Image(showBackHand ? model.players[3].playerCards[12].image : "card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 60, height: 60).animation( .easeInOut, value: showFrontHand)
                                    }
                                }
                                VStack {
                                    if isShowCompare {
                                        if (!showMiddleHand){
                                            Button {
                                                showFrontHand = false
                                                showMiddleHand = true
                                                isShowFrontHandResult = false
                                                isShowMiddleHandResult = true
                                            } label: {
                                                // Show preview button
                                                ZStack(alignment:.center){
                                                    Text("Compare").foregroundColor(.white).bold()
                                                }
                                            }
                                        }
                                        else{
                                            Button {
                                                showBackHand = true
                                                isShowMiddleHandResult = false
                                                showMiddleHand = false
                                                isShowCompare = false
                                                isShowBackHandResult = true
                                            } label: {
                                                // Show preview button
                                                ZStack(alignment:.center){
                                                    Text("Compare").foregroundColor(.white).bold()
                                                }
                                            }
                                        }
                                       
                                    }
                                    if isShowArrange{
                                        Button {
                                            self.isTogglePreview.toggle()
                                        } label: {
                                            // Show preview button
                                            ZStack(alignment:.center){
                                                Text("Arrange").foregroundColor(.white).bold()
                                            }
                                        }
                                        // Open the new screen cover
                                        .fullScreenCover(isPresented: $isTogglePreview) {
                                            PlayView(showFrontHand: $showFrontHand,isShowCompare:$isShowCompare,isShowArrange:$isShowArrange,isShowFrontHandResult:$isShowFrontHandResult)
                                            
                                        }
                                    }
                                   
                                    
                                    ZStack(alignment:.bottomTrailing){
                                        Rectangle().foregroundColor(Color("Table")).frame(width: geo.size.width/7*2.2, height: geo.size.height/16).clipShape(Capsule())
                                            .opacity(0.8)
                                        HStack(){
                                            VStack{
                                                Text(model.players[3].playerName).foregroundColor(.red).font(.system(size: 13))
                                                if let score = model.players[3].money{
                                                    Text("$\(score)").foregroundColor(.yellow).font(.system(size: 13))
                                                }
                                            }
                                            Image(model.players[3
                                                               ].image).resizable().aspectRatio(contentMode: .fit)
                                                .frame(width: geo.size.width/8, height: geo.size.height/16)
                                                .clipShape(Circle())
                                        }
                                    }
                                }
                            }.offset(y:15)
                        }.padding(.vertical,40)
                        HStack{
                            //MARK: BOT2
                            VStack(alignment:.leading) {
                                ZStack(alignment:.bottomLeading){
                                    Rectangle().foregroundColor(Color("Table")).frame(width: geo.size.width/7*2.2, height: geo.size.height/16).clipShape(Capsule())
                                        .opacity(0.8)
                                    HStack(){
                                        
                                        Image(model.players[1].image).resizable().aspectRatio(contentMode: .fit)
                                            .frame(width: geo.size.width/8, height: geo.size.height/16)
                                            .clipShape(Circle())
                                        VStack{
                                            Text(model.players[1].playerName).foregroundColor(.red).font(.system(size: 13))
                                            if let score = model.players[1].money{
                                                Text("$\(score)").foregroundColor(.yellow).font(.system(size: 13))
                                            }
                                        }
                                    }
                                }
                                VStack(alignment:.leading,spacing:-10){
                                    HStack(spacing:-30){
                                        Image(showFrontHand ? botHand2[0].image : "card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 60, height: 60).animation( .easeInOut, value: showFrontHand)
                                        Image(showFrontHand ? botHand2[1].image : "card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 60, height: 60).animation( .easeInOut, value: showFrontHand)
                                        Image(showFrontHand ? botHand2[2].image : "card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 60).animation( .easeInOut, value: showFrontHand)
                                    }
                                    HStack(spacing:-30){
                                        Image(showMiddleHand ? botHand2[3].image : "card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 60, height: 60).animation( .easeInOut, value: showFrontHand)
                                        Image(showMiddleHand ? botHand2[4].image : "card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 60, height: 60).animation( .easeInOut, value: showFrontHand)
                                        Image(showMiddleHand ? botHand2[5].image : "card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 60, height: 60).animation( .easeInOut, value: showFrontHand)
                                        Image(showMiddleHand ? botHand2[6].image : "card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 60, height: 60).animation( .easeInOut, value: showFrontHand)
                                        Image(showMiddleHand ? botHand2[7].image : "card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 60, height: 60).animation( .easeInOut, value: showFrontHand)
                                    }
                                    HStack(spacing:-30){
                                        Image(showBackHand ? botHand2[8].image : "card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 60, height: 60).animation( .easeInOut, value: showFrontHand)
                                        Image(showBackHand ? botHand2[9].image : "card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 60, height: 60).animation( .easeInOut, value: showFrontHand)
                                        Image(showBackHand ? botHand2[10].image : "card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 60, height: 60).animation( .easeInOut, value: showFrontHand)
                                        Image(showBackHand ? botHand2[11].image : "card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 60, height: 60).animation( .easeInOut, value: showFrontHand)
                                        Image(showBackHand ? botHand2[12].image : "card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 60, height: 60).animation( .easeInOut, value: showFrontHand)
                                    }
                                }
                                VStack{
                                    if (isShowFrontHandResult){
                                        Text("\((model.playerBot2?.rankFrontHand ?? 0)*100)")
                                    }
                                    if isShowMiddleHandResult{
                                        Text("\((model.playerBot2?.rankMiddleHand ?? 0)*100)")
                                    }
                                    if isShowBackHandResult{
                                        Text("\((model.playerBot2?.rankBackHand ?? 0)*100)")
                                    }
                                }.padding(.leading)
                            }.offset(y:-30)
                            
                            
                            Spacer()
                            //MARK: BOT3
                            VStack (alignment:.trailing) {
                                ZStack(alignment:.bottomTrailing){
                                    Rectangle().foregroundColor(Color("Table")).frame(width: geo.size.width/7*2.2, height: geo.size.height/16).clipShape(Capsule())
                                        .opacity(0.8)
                                    HStack(){
                                        VStack{
                                            Text(model.players[2].playerName).foregroundColor(.red).font(.system(size: 13))
                                            if let score = model.players[2].money{
                                                Text("$\(score)").foregroundColor(.yellow).font(.system(size: 13))
                                            }
                                        }
                                        Image(model.players[2].image).resizable().aspectRatio(contentMode: .fit)
                                            .frame(width: geo.size.width/8, height: geo.size.height/16)
                                            .clipShape(Circle())
                                    }
                                }
                                VStack(alignment:.trailing,spacing:-10){
                                    HStack(spacing:-30){
                                        Image(showFrontHand ? botHand3[0].image : "card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 60, height: 60).animation( .easeInOut, value: showFrontHand)
                                        Image(showFrontHand ? botHand3[1].image : "card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 60, height: 60).animation( .easeInOut, value: showFrontHand)
                                        Image(showFrontHand ? botHand3[2].image : "card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 60).animation( .easeInOut, value: showFrontHand)
                                    }
                                    HStack(spacing:-30){
                                        Image(showMiddleHand ? botHand3[3].image : "card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 60, height: 60).animation( .easeInOut, value: showFrontHand)
                                        Image(showMiddleHand ? botHand3[4].image : "card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 60, height: 60).animation( .easeInOut, value: showFrontHand)
                                        Image(showMiddleHand ? botHand3[5].image : "card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 60, height: 60).animation( .easeInOut, value: showFrontHand)
                                        Image(showMiddleHand ? botHand3[6].image : "card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 60, height: 60).animation( .easeInOut, value: showFrontHand)
                                        Image(showMiddleHand ? botHand3[7].image : "card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 60, height: 60).animation( .easeInOut, value: showFrontHand)
                                    }
                                    HStack(spacing:-30){
                                        Image(showBackHand ? botHand3[8].image : "card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 60, height: 60).animation( .easeInOut, value: showFrontHand)
                                        Image(showBackHand ? botHand3[9].image : "card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 60, height: 60).animation( .easeInOut, value: showFrontHand)
                                        Image(showBackHand ? botHand3[10].image : "card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 60, height: 60).animation( .easeInOut, value: showFrontHand)
                                        Image(showBackHand ? botHand3[11].image : "card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 60, height: 60).animation( .easeInOut, value: showFrontHand)
                                        Image(showBackHand ? botHand3[12].image : "card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 60, height: 60).animation( .easeInOut, value: showFrontHand)
                                    }
                                }
                                VStack{
                                    if (isShowFrontHandResult){
                                        Text("\((model.playerBot3?.rankFrontHand ?? 0)*100)")
                                    }
                                    if isShowMiddleHandResult{
                                        Text("\((model.playerBot3?.rankMiddleHand ?? 0)*100)")
                                    }
                                    if isShowBackHandResult{
                                        Text("\((model.playerBot3?.rankBackHand ?? 0)*100)")
                                    }
                                }.padding(.trailing)
                            }.offset(y:-30)
                        }.padding()
                    }
                    Spacer()
                    
                }.background(Color("Background")).ignoresSafeArea()
               
            }
        }
        .onChange(of: model.players[3].playerCards, perform: {
            newValue in
            frontHandPlayer =  cardModel.evaluateHand(cards: [model.players[3].playerCards[0],model.players[3].playerCards[1],model.players[3].playerCards[2]]).rawValue
            middleHandPlayer =  cardModel.evaluateHand(cards: [model.players[3].playerCards[3]
                                                               ,model.players[3].playerCards[4]
                                                               ,model.players[3].playerCards[5]
                                                               ,model.players[3].playerCards[6]
                                                               ,model.players[3].playerCards[7]]).rawValue
            backHandPlayer =  cardModel.evaluateHand(cards: [model.players[3].playerCards[8]
                                                             ,model.players[3].playerCards[9]
                                                             ,model.players[3].playerCards[10]
                                                             ,model.players[3].playerCards[11]
                                                             ,model.players[3].playerCards[12]]).rawValue
            
            model.compareHand(bot1: [botHand1[0],botHand1[1],botHand1[2]],
                              bot2: [botHand2[0],botHand2[1],botHand2[2]],
                              bot3: [botHand3[0],botHand3[1],botHand3[2]],
                              player:[model.players[3].playerCards[0],model.players[3].playerCards[1],model.players[3].playerCards[2]],type: "FrontHand")
            
            model.compareHand(bot1: [botHand1[3],botHand1[4],botHand1[5],botHand1[6],botHand1[7]],
                              bot2: [botHand2[3],botHand2[4],botHand2[5],botHand2[6],botHand2[7]],
                              bot3: [botHand3[3],botHand3[4],botHand3[5],botHand3[6],botHand3[7]],
                              player:[model.players[3].playerCards[3],model.players[3].playerCards[4],model.players[3].playerCards[5],model.players[3].playerCards[6],model.players[3].playerCards[7]],type: "MiddleHand")
            
            model.compareHand(bot1: [botHand1[8],botHand1[9],botHand1[10],botHand1[11],botHand1[12]],
                              bot2: [botHand2[8],botHand2[9],botHand2[10],botHand2[11],botHand2[12]],
                              bot3: [botHand3[8],botHand3[9],botHand3[10],botHand3[11],botHand3[12]],
                              player:[model.players[3].playerCards[8],model.players[3].playerCards[9],model.players[3].playerCards[10],model.players[3].playerCards[11],model.players[3].playerCards[12]],type: "BackHand")

        })
        .onAppear {
           
            MusicPlayer.shared.startBackgroundMusic()
            audioPlayer?.stop()
            botHand1 = model.botLogic(player: model.players[0])
            frontHandBotHand1 = cardModel.evaluateHand(cards: [botHand1[0],botHand1[1],botHand1[2]]).rawValue
            middleHandBotHand1 = cardModel.evaluateHand(cards: [botHand1[3],botHand1[4],botHand1[5],botHand1[6],botHand1[7]]).rawValue
            backHandBotHand1 = cardModel.evaluateHand(cards: [botHand1[8],botHand1[9],botHand1[10],botHand1[11],botHand1[12]]).rawValue
            
            
            botHand2 = model.botLogic(player: model.players[1])
            frontHandBotHand2 = cardModel.evaluateHand(cards: [botHand2[0],botHand2[1],botHand2[2]]).rawValue
            middleHandBotHand2 = cardModel.evaluateHand(cards: [botHand2[3],botHand2[4],botHand2[5],botHand2[6],botHand2[7]]).rawValue
            backHandBotHand2 = cardModel.evaluateHand(cards: [botHand2[8],botHand2[9],botHand2[10],botHand2[11],botHand2[12]]).rawValue
            
            botHand3 = model.botLogic(player: model.players[2])
            frontHandBotHand3 = cardModel.evaluateHand(cards: [botHand3[0],botHand3[1],botHand3[2]]).rawValue
            middleHandBotHand3 = cardModel.evaluateHand(cards: [botHand3[3],botHand3[4],botHand3[5],botHand3[6],botHand3[7]]).rawValue
            backHandBotHand3 = cardModel.evaluateHand(cards: [botHand3[8],botHand3[9],botHand3[10],botHand3[11],botHand3[12]]).rawValue
            
            
            model.compareHand(bot1: [botHand1[0],botHand1[1],botHand1[2]],
                              bot2: [botHand2[0],botHand2[1],botHand2[2]],
                              bot3: [botHand3[0],botHand3[1],botHand3[2]],
                              player:[model.players[3].playerCards[0],model.players[3].playerCards[1],model.players[3].playerCards[2]],type: "FrontHand")
            
            model.compareHand(bot1: [botHand1[3],botHand1[4],botHand1[5],botHand1[6],botHand1[7]],
                              bot2: [botHand2[3],botHand2[4],botHand2[5],botHand2[6],botHand2[7]],
                              bot3: [botHand3[3],botHand3[4],botHand3[5],botHand3[6],botHand3[7]],
                              player:[model.players[3].playerCards[3],model.players[3].playerCards[4],model.players[3].playerCards[5],model.players[3].playerCards[6],model.players[3].playerCards[7]],type: "MiddleHand")
            
            model.compareHand(bot1: [botHand1[8],botHand1[9],botHand1[10],botHand1[11],botHand1[12]],
                              bot2: [botHand2[8],botHand2[9],botHand2[10],botHand2[11],botHand2[12]],
                              bot3: [botHand3[8],botHand3[9],botHand3[10],botHand3[11],botHand3[12]],
                              player:[model.players[3].playerCards[8],model.players[3].playerCards[9],model.players[3].playerCards[10],model.players[3].playerCards[11],model.players[3].playerCards[12]],type: "BackHand")
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            MainView().environmentObject(PlayerModel())
                .environmentObject(CardModel())
//                .environment(\.colorScheme,.dark)
            
        }
    }
}
