/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 2
 Author: Your name (e.g. Vo Quoc Huy)
 ID: Your student id (e.g. s3823236)
 Created  date: dd/mm/yyyy (e.g. 26/08/2022)
 Last modified: dd/mm/yyyy (e.g. 26/08/2022)
 Acknowledgement:
 https://stackoverflow.com/questions/62669320/initializing-a-slider-value-in-swiftui
 https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-a-segmented-control-and-read-values-from-it
 */

import SwiftUI

struct ChooseModeView: View {
    // Environment object to get access to these variables in the view model
    @EnvironmentObject var gameModel: GameModel
    @EnvironmentObject var playerModel:PlayerModel
    // State variable to detect and show by condition
    @State private var bet: Int = 100
    @State private var mode = "Easy"
    @State private var modeIndex = 0
    @State private var isPresented = false
    // Binding variable to update these variables from other views
    @Binding var isShowMode:Bool
    // Variables required passing from other views
    let modes = ["Easy","Medium","Hard"]
    var width: CGFloat
    var height: CGFloat
    
    // Custom type for value in slider
    var intProxy: Binding<Double>{
        Binding<Double>(get: {
            //returns the score as a Double
            return Double(bet)
        }, set: {
            //rounds the double to an Int
            bet = Int($0)
        })
    }
    
    var body: some View {
        GeometryReader {
            geo in
            VStack {
                Spacer()
                VStack(spacing:25){
                    Spacer()
                    VStack(alignment:.leading,spacing:10){
                        HStack{
                            Spacer()
                            Text("Create Table").font(.title).foregroundColor(.white).offset(x:20)
                            Spacer()
                            Button {
                                playSound(sound: "ClickButton", type: "mp3")
                                withAnimation (.easeInOut(duration: 0.7)) {
                                    isShowMode = false
                                }
                            } label: {
                                Image(systemName: "xmark.circle").resizable().aspectRatio(contentMode: .fit).foregroundColor(Color("primary")).frame(width: 40, height: 40)
                            }
                            
                        }.padding(.trailing).padding(.vertical,20)
                        HStack{
                            Text("🏆").font(.system(size: 30))
                            Text("Level").foregroundColor(.white)
                            Spacer()
                            Text(playerModel.ranking ?? "").foregroundColor(.white)
                            Spacer()
                        }.padding(.horizontal)
                        
                        VStack (alignment:.leading,spacing:15){
                            HStack {
                                Text("♠︎").font(.system(size: 30)).foregroundColor(Color("secondary"))
                                Text("Mode").foregroundColor(.white)
                                Spacer()
                                Text("\(modes[modeIndex])").foregroundColor(.white)
                                Spacer()
                            }
                            Picker("Select a paint color", selection: $modeIndex) {
                                ForEach(0..<modes.count, id: \.self) {
                                    index in
                                    Text(modes[index]).foregroundColor(.red)
                                }
                            }.pickerStyle(SegmentedPickerStyle())
                        }.padding(.horizontal)
                        
                        VStack(alignment:.leading){
                            HStack {
                                Image(systemName: "dollarsign.circle").resizable().aspectRatio(contentMode: .fit).foregroundColor(Color("secondary")).frame(width: 30, height: 30)
                                Text("Bet Amount:").foregroundColor(.white)
                                Text("\(bet)").foregroundColor(.white)
                            }.padding()
                            Slider(value: intProxy, in: 100...2000, step: 100).padding(.horizontal)
                        }
                        HStack{
                            Spacer()
                            Button {
                                playSound(sound: "ClickButton", type: "mp3")
                                withAnimation(.easeInOut(duration: 3))  {
                                    isPresented = true
                                }
                            } label: {
                                ZStack{
                                    Rectangle().foregroundColor(Color("primary")).clipShape(Capsule()).frame(width: geo.size.width/2.5, height: geo.size.height/12).shadow(color: .white, radius: 3)
                                    Text("PLAY").foregroundColor(.white).font(.system(size: 23))
                                }
                                
                            }
                            .fullScreenCover(isPresented: $isPresented,onDismiss: {
                                backgroundMusicPlayer.shared.startBackgroundMusic(sound: "MainView", type: "wav")
                                
                            }) {
                                MainView(isShowMode:$isShowMode).animation(.easeInOut(duration: 1))
                                
                            }
                            Spacer()
                        }.padding(.top)
                        Spacer()
                    }
                    Spacer()
                }.frame(width: width, height: height)
                    .background(Color("Table"))
                    .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
                Spacer()
              // Update the mode for the game when choosing mode
            }.onChange(of: modeIndex) { newValue in
                gameModel.mode = modes[modeIndex]
                // Update the betamount for the game when choosing betamount
            }.onChange(of: bet) { newValue in
                gameModel.betAmount = bet
            }
            // Update the money for the player when money is changing
            .onChange(of: playerModel.currentPlayer?.money, perform: { newValue in
                playerModel.updateAchivement()
            })
            .onAppear{
                gameModel.mode = modes[modeIndex]
                playerModel.updateAchivement()
                
            }
        }
    }
    
}

struct ChooseModeView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseModeView(isShowMode:.constant(false),width:400,height:400)
            .environmentObject(GameModel())
    }
}
