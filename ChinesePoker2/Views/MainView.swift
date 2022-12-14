/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 2
 Author: Your name (e.g. Vo Quoc Huy)
 ID: Your student id (e.g. s3823236)
 Created  date: dd/mm/yyyy (e.g. 23/08/2022)
 Last modified: dd/mm/yyyy (e.g. 29/08/2022)
 */

import SwiftUI
import AVFoundation

struct MainView: View {
    // Environment to control the presentation mode (sheet or fullscreen over)
    @Environment(\.presentationMode) var presentationMode
    // Environment object to get access to these variables in the view model
    @EnvironmentObject var model:GameModel
    @EnvironmentObject var cardModel:CardModel
    @EnvironmentObject var playerModel:PlayerModel
    // State variable to check the current tab selection
    @State private var showFrontHand: Bool = false
    @State private var isShowCompare: Bool = false
    @State private var isShowArrange:Bool = true
    @State private var isShowDone:Bool = false
    @State private var isShowGameOver:Bool = false
    @State private var isToggleHomeButton:Bool = false
    
    // Binding variable to update these variables from other views
    @Binding var isShowMode:Bool
    // State variable to check the current tab selection
    @State var showMiddleHand = false
    @State var showBackHand = false
    @State var frontHandBotHand1 = 0
    @State var frontHandBotHand2 = 0
    @State var frontHandBotHand3 = 0
    
    // State variable to check the current tab selection
    @State var middleHandBotHand1 = 0
    @State var middleHandBotHand2 = 0
    @State var middleHandBotHand3 = 0
    
    // State variable to check the current tab selection
    @State var backHandBotHand1 = 0
    @State var backHandBotHand2 = 0
    @State var backHandBotHand3 = 0
    
    // State variable to check the current tab selection
    @State var botHand1 = Stack()
    @State var botHand2 = Stack()
    @State var botHand3 = Stack()
    
    // State variable to check the current tab selection
    @State var frontHandPlayer = 0
    @State var middleHandPlayer = 0
    @State var backHandPlayer = 0
    @State private var isShowFrontHandResult:Bool = false
    @State var isShowMiddleHandResult = false
    @State var isShowBackHandResult = false
    
    // State variable to check if the button status
    @State var isTogglePreview = false
    @State var isToggleGameSetting = false
    
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
                        VStack(){
                            // MARK: BOT1
                            VStack {
                                ZStack{
                                    // Game Info button
                                    Button {isToggleGameSetting = true
                                        playSound(sound: "ClickButton", type: "mp3")
                                        
                                    } label: {
                                        Image(systemName: "lightbulb.circle").resizable().aspectRatio(contentMode: .fit).frame(width: 40, height: 40).foregroundColor(Color("secondary")).shadow(color: Color.yellow.opacity(0.5), radius: 15, x: 1, y: 1)
                                    }.offset(x:140,y:-5)
                                    PlayerAvatarView(width: geo.size.width, height: geo.size.height, name: model.playerBot1.playerName , image: model.playerBot1.image, money: model.playerBot1.money , alignment: .bottomTrailing)
                                    // Back home button
                                    Button {
                                        // play sound
                                        playSound(sound: "ClickButton", type: "mp3")
                                        // show back home view
                                        isToggleHomeButton = true
                                    } label: {
                                        Image(systemName: "house.circle").resizable().aspectRatio(contentMode: .fit).frame(width: 40, height: 40).foregroundColor(Color("secondary")).shadow(color: Color.yellow.opacity(0.5), radius: 15, x: 1, y: 1)
                                    }.offset(x:-140,y:-5)
                                }
                                PlayerDeckView(cards: botHand1, showFrontHand: $showFrontHand, showMiddleHand: $showMiddleHand, showBackHand: $showBackHand, alignment: .leading)
                                //MARK: Rank Hand bot1
                                RankHandPlayerView(
                                    isShowFrontHandResult: $isShowFrontHandResult,
                                    isShowMiddleHandResult: $isShowMiddleHandResult,
                                    isShowBackHandResult: $isShowBackHandResult,
                                    frontHandProfit: (model.playerBot1.rankFrontHand ?? 0)*(model.betAmount ?? 100),
                                    secondHandProfit: (model.playerBot1.rankMiddleHand ?? 0)*(model.betAmount ?? 100),
                                    thirdHandProfit: (model.playerBot1.rankBackHand ?? 0)*(model.betAmount ?? 100),
                                    frontHandRank: model.playerBot1.rankFrontHand ?? 0,
                                    secondHandRank: model.playerBot1.rankMiddleHand ?? 0,
                                    thirdHandRank: model.playerBot1.rankBackHand ?? 0
                                )
                            }
                            Spacer()
                            // MARK: PLAYER
                            VStack() {
                                //MARK: Rank Hand Player
                                RankHandPlayerView(
                                    isShowFrontHandResult: $isShowFrontHandResult,
                                    isShowMiddleHandResult: $isShowMiddleHandResult,
                                    isShowBackHandResult: $isShowBackHandResult,
                                    frontHandProfit: (model.myPlayer?.rankFrontHand ?? 0)*(model.betAmount ?? 100),
                                    secondHandProfit: (model.myPlayer?.rankMiddleHand ?? 0)*(model.betAmount ?? 100),
                                    thirdHandProfit: (model.myPlayer?.rankBackHand ?? 0)*(model.betAmount ?? 100),
                                    frontHandRank: model.myPlayer?.rankFrontHand ?? 0,
                                    secondHandRank: model.myPlayer?.rankMiddleHand ?? 0,
                                    thirdHandRank: model.myPlayer?.rankBackHand ?? 0
                                )
                                
                                PlayerDeckView(cards: model.players[3].playerCards, showFrontHand: $showFrontHand, showMiddleHand: $showMiddleHand, showBackHand: $showBackHand, alignment: .leading)
                                //MARK: PLAYER Button
                                HStack (spacing:20){
                                    PlayerAvatarView(width: geo.size.width, height: geo.size.height, name: model.myPlayer?.playerName ?? "" , image: model.myPlayer!.image, money: model.myPlayer?.money ?? 0, alignment: .bottomTrailing)
                                    // Compare button
                                    if isShowCompare {
                                        if (!showMiddleHand){
                                            Button {
                                                // playsound
                                                playSound(sound: "ClickButton", type: "mp3")
                                                // play either win or lose sound depending on the rank middle hand
                                                if (model.myPlayer?.rankMiddleHand ?? 0 > 0){
                                                    playSound(sound: "WinHand", type: "mp3")
                                                }
                                                else{
                                                    playSound(sound: "LoseHand", type: "mp3")
                                                    
                                                }
                                                showFrontHand = false
                                                showMiddleHand = true
                                                isShowFrontHandResult = false
                                                isShowMiddleHandResult = true
                                            } label: {
                                                ButtonView(width: geo.size.width/3.8, height: geo.size.height/17, text: "Compare", color: "primary")
                                            }
                                        }
                                        else{
                                            Button {
                                                // playsound
                                                playSound(sound: "ClickButton", type: "mp3")
                                                // play either win or lose sound depending on the rank back hand
                                                if (model.myPlayer?.rankBackHand ?? 0 > 0){
                                                    playSound(sound: "WinHand", type: "mp3")
                                                }
                                                else{
                                                    playSound(sound: "LoseHand", type: "mp3")
                                                }
                                                showBackHand = true
                                                isShowMiddleHandResult = false
                                                showMiddleHand = false
                                                isShowCompare = false
                                                isShowBackHandResult = true
                                                isShowDone = true
                                            } label: {
                                                ButtonView(width: geo.size.width/3.8, height: geo.size.height/17, text: "Compare", color: "primary")
                                            }
                                        }
                                        
                                    }
                                    // Done Button
                                    if(isShowDone){
                                        Button {
                                            // playsound
                                            playSound(sound: "Done", type: "wav")
                                            // Player Profit
                                            let frontHandProfit = (model.myPlayer?.rankFrontHand ?? 0)*(model.betAmount ?? 100)
                                            let middleHandProfit = (model.myPlayer?.rankMiddleHand ?? 0)*(model.betAmount ?? 100)
                                            let backHandProfit = (model.myPlayer?.rankBackHand ?? 0)*(model.betAmount ?? 100)
                                            
                                            // Player bot1
                                            let frontHandProfitBot1 = (model.playerBot1.rankFrontHand ?? 0)*(model.betAmount ?? 100)
                                            let middleHandProfitBot1 = (model.playerBot1.rankMiddleHand ?? 0)*(model.betAmount ?? 100)
                                            let backHandProfitBot1 = (model.playerBot1.rankBackHand ?? 0)*(model.betAmount ?? 100)
                                            
                                            // Player bot2
                                            let frontHandProfitBot2 = (model.playerBot2.rankFrontHand ?? 0)*(model.betAmount ?? 100)
                                            let middleHandProfitBot2 = (model.playerBot2.rankMiddleHand ?? 0)*(model.betAmount ?? 100)
                                            let backHandProfitBot2 = (model.playerBot2.rankBackHand ?? 0)*(model.betAmount ?? 100)
                                            
                                            // Player bot3
                                            let frontHandProfitBot3 = (model.playerBot3.rankFrontHand ?? 0)*(model.betAmount ?? 100)
                                            let middleHandProfitBot3 = (model.playerBot3.rankMiddleHand ?? 0)*(model.betAmount ?? 100)
                                            let backHandProfitBot3 = (model.playerBot3.rankBackHand ?? 0)*(model.betAmount ?? 100)
                                            
                                            // update money for player and 3 bots
                                            model.playerBot1.money += frontHandProfitBot1 + middleHandProfitBot1 + backHandProfitBot1
                                            model.playerBot2.money += frontHandProfitBot2 + middleHandProfitBot2 + backHandProfitBot2
                                            model.playerBot3.money += frontHandProfitBot3 + middleHandProfitBot3 + backHandProfitBot3
                                            model.myPlayer?.money += frontHandProfit + middleHandProfit + backHandProfit
                                            
                                            playerModel.currentPlayer?.money += frontHandProfit + middleHandProfit + backHandProfit
                                            isShowDone = false
                                            isShowGameOver = true
                                        } label: {
                                            ButtonView(width: geo.size.width/3.8, height: geo.size.height/17, text: "Done", color: "primary")
                                        }
                                    }
                                    // Arrange button
                                    if isShowArrange{
                                        Button {
                                            playSound(sound: "ClickButton", type: "mp3")
                                            self.isTogglePreview.toggle()
                                        } label: {
                                            ButtonView(width: geo.size.width/3.8, height: geo.size.height/17, text: "Arrange", color: "primary")
                                        }
                                        // Open the new screen cover
                                        .fullScreenCover(isPresented: $isTogglePreview) {
                                            PlayView(showFrontHand: $showFrontHand,isShowCompare:$isShowCompare,isShowArrange:$isShowArrange,isShowFrontHandResult:$isShowFrontHandResult)
                                        }
                                    }
                                }.padding()
                            }.offset(y:15)
                        }.padding(.vertical,40)
                        HStack{
                            //MARK: BOT2
                            VStack(alignment:.leading) {
                                PlayerAvatarView(width: geo.size.width, height: geo.size.height, name: model.playerBot2.playerName , image: model.playerBot2.image, money: model.playerBot2.money , alignment: .bottomTrailing)
                                PlayerDeckView(cards: botHand2, showFrontHand: $showFrontHand, showMiddleHand: $showMiddleHand, showBackHand: $showBackHand, alignment: .leading)
                                //MARK: Rank Hand bot2
                                HStack{
                                    Spacer()
                                    RankHandPlayerView(
                                        isShowFrontHandResult: $isShowFrontHandResult,
                                        isShowMiddleHandResult: $isShowMiddleHandResult,
                                        isShowBackHandResult: $isShowBackHandResult,
                                        frontHandProfit: (model.playerBot2.rankFrontHand ?? 0)*(model.betAmount ?? 100),
                                        secondHandProfit: (model.playerBot2.rankMiddleHand ?? 0)*(model.betAmount ?? 100),
                                        thirdHandProfit: (model.playerBot2.rankBackHand ?? 0)*(model.betAmount ?? 100),
                                        frontHandRank: model.playerBot2.rankFrontHand ?? 0,
                                        secondHandRank: model.playerBot2.rankMiddleHand ?? 0,
                                        thirdHandRank: model.playerBot2.rankBackHand ?? 0
                                    )
                                    Spacer()
                                }
                            }.offset(x:-10,y:-30)
                            
                            
                            Spacer()
                            //MARK: BOT3
                            VStack (alignment:.trailing) {
                                PlayerAvatarView(width: geo.size.width, height: geo.size.height, name: model.playerBot3.playerName , image: model.playerBot3.image, money: model.playerBot3.money , alignment: .bottomTrailing)
                                PlayerDeckView(cards: botHand3, showFrontHand: $showFrontHand, showMiddleHand: $showMiddleHand, showBackHand: $showBackHand, alignment: .trailing)
                                //MARK: Rank Hand bot 3
                                HStack{
                                    Spacer()
                                    RankHandPlayerView(
                                        isShowFrontHandResult: $isShowFrontHandResult,
                                        isShowMiddleHandResult: $isShowMiddleHandResult,
                                        isShowBackHandResult: $isShowBackHandResult,
                                        frontHandProfit: (model.playerBot3.rankFrontHand ?? 0)*(model.betAmount ?? 100),
                                        secondHandProfit: (model.playerBot3.rankMiddleHand ?? 0)*(model.betAmount ?? 100),
                                        thirdHandProfit: (model.playerBot3.rankBackHand ?? 0)*(model.betAmount ?? 100),
                                        frontHandRank: model.playerBot3.rankFrontHand ?? 0,
                                        secondHandRank: model.playerBot3.rankMiddleHand ?? 0,
                                        thirdHandRank: model.playerBot3.rankBackHand ?? 0
                                    )
                                    
                                    Spacer()
                                    
                                }
                            }.offset(y:-30)
                        }.padding()
                    }
                    Spacer()
                    
                }.background(Color("Background")).ignoresSafeArea().blur(radius:isToggleGameSetting || isShowGameOver || isToggleHomeButton ? 3 : 0)
                //MARK: GAME SETTING
                if (isToggleGameSetting){
                    GameInfoView(width: geo.size.width, height: geo.size.height, isToggleGameSetting: $isToggleGameSetting, betAmount: model.betAmount ?? 100, mode: model.mode ?? "" ).animation(.easeInOut, value: isShowGameOver)
                }
                
                //MARK: GAME OVER
                if(isShowGameOver){
                    GameOverView(frontHandProfit: (model.myPlayer?.rankFrontHand ?? 0)*(model.betAmount ?? 100), middleHandProfit: (model.myPlayer?.rankMiddleHand ?? 0)*(model.betAmount ?? 100), backHandProfit: (model.myPlayer?.rankBackHand ?? 0)*(model.betAmount ?? 100), width: geo.size.width, height: geo.size.height, money: model.myPlayer?.money ?? 0, isShowGameOver: $isShowGameOver, isShowMode: $isShowMode).animation(.easeInOut, value: isShowGameOver)
                }
                //MARK: Home Button
                if (isToggleHomeButton){
                    BackHomeView(isToggleHomeButton: $isToggleHomeButton,isShowMode:$isShowMode, width: geo.size.width, height: geo.size.height)
                }
            }
        }
        // update bot1 money when bot1 money is changing
        .onChange(of: model.playerBot1.money, perform: { newValue in
            model.updateBot1()
        })
        // update bot2 money when bot2 money is changing
        .onChange(of: model.playerBot2.money, perform: { newValue in
            model.updateBot2()
        })
        // update bot3 money when bot3 money is changing
        .onChange(of: model.playerBot3.money, perform: { newValue in
            model.updateBot3()
        })
        // update player money when player money is changing
        .onChange(of: playerModel.currentPlayer?.money, perform: { value in
            playerModel.updateAchivement()
            playerModel.resetMoneyForUser()
        })
        // update value for play cards when it changing
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
            // play the background music 2 for mainview, playview
            backgroundMusicPlayer.shared.startBackgroundMusic(sound: "Background2", type: "wav")
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
            
            model.compareHand(bot1:[botHand1[8],botHand1[9],botHand1[10],botHand1[11],botHand1[12]],
                              bot2:[botHand2[8],botHand2[9],botHand2[10],botHand2[11],botHand2[12]],
                              bot3:[botHand3[8],botHand3[9],botHand3[10],botHand3[11],botHand3[12]],
                              player:[model.players[3].playerCards[8],model.players[3].playerCards[9],model.players[3].playerCards[10],model.players[3].playerCards[11],model.players[3].playerCards[12]],type: "BackHand")
        }
    }
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            MainView(isShowMode: .constant(true)).environmentObject(GameModel())
                .environmentObject(CardModel())
        }
    }
}
