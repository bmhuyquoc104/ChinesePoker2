/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 2
 Author: Your name (e.g. Vo Quoc Huy)
 ID: Your student id (e.g. s3823236)
 Created  date: dd/mm/yyyy (e.g. 25/08/2022)
 Last modified: dd/mm/yyyy (e.g. 26/08/2022)
 Acknowledgement:https://stackoverflow.com/questions/60804512/swiftui-create-a-custom-segmented-control-also-in-a-scrollview
 */

import SwiftUI
import AVFoundation


struct HomeView: View {
    // Environment object to get access to these variables in the view model
    @EnvironmentObject var playerModel:PlayerModel
    // State variable to check the current tab selection
    @State private var isShowMainView = false
    @State private var isShowRule = false
    @State private var isShowSetting = false
    @State private var isShowMode = false
    
    // Custom the uisegmented control
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color("primary"))
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(.white)], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(.white)], for: .normal)
    }
    
    var body: some View {
        GeometryReader {
            geo in
            VStack(spacing:35){
                HStack{
                    Spacer()
                    Button {
                        //playsound
                        playSound(sound: "ClickButton", type: "mp3")
                        //animate
                        withAnimation (.easeInOut(duration: 0.7)){
                            // show rule
                            isShowRule = true
                        }
                    } label: {
                        Image(systemName: "questionmark.circle.fill").resizable().aspectRatio(contentMode: .fit).frame(width: 40, height: 40).foregroundColor(Color("ButtonBackground")).shadow(color: Color.white.opacity(0.7), radius: 5, x: 1, y: 1)
                    }
                    .sheet(isPresented: $isShowRule){
                        RuleView()
                    }
                }.padding()
                VStack(spacing:20){
                    // If the user is new -> custom corresponding welcome message
                    if playerModel.typeOfUser == "new"{
                        HStack{
                            Text("Hello").font(.title).foregroundColor(.white)
                            Text(playerModel.currentPlayer?.playerName ?? "").font(.title).foregroundColor(Color("secondary"))
                        }
                        Text ("Nice to see you. Let's have some fun").font(.system(size: 18)).foregroundColor(.white)
                        
                    }
                    // if the uer is not -> custom corresponding welcome message
                    else if playerModel.typeOfUser == "old"{
                        HStack{
                            Text("Welcome back").font(.title).foregroundColor(.white)
                            Text(playerModel.currentPlayer?.playerName ?? "").font(.title).foregroundColor(Color("secondary"))
                        }
                    }
                    Image("home_image2").resizable().aspectRatio(contentMode: .fit)
                }.padding()
                Button {
                    //animation
                    withAnimation (.easeInOut(duration: 0.7)) {
                        // show mode
                        isShowMode = true
                    }
                    // playsound
                    playSound(sound: "ClickButton", type: "mp3")
                } label: {
                    ZStack {
                        Rectangle().foregroundColor(Color("primary")).clipShape(Capsule()).frame(width: geo.size.width/2.5, height: geo.size.height/12).shadow(color: .white, radius: 3)
                        Text("PLAY NOW").foregroundColor(.white).font(.system(size: 23))
                    }
                }
                Spacer()
                
            }.padding()
                .background(Color("Background")).blur(radius: isShowMode ? 4 : 0)
            if isShowMode{
                ChooseModeView(isShowMode:$isShowMode,width: geo.size.width/14*13, height: geo.size.height/1.7).padding(.horizontal)
            }
        }.background(Color("Background"))
        // testing purposes
        //            .onAppear {
        //                playerModel.removeAll()
        //            }
        
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
        HomeView().environment(
            \.colorScheme, .dark)
    }
}
