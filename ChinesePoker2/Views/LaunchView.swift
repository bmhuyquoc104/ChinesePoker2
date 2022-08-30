/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 2
 Author: Your name (e.g. Vo Quoc Huy)
 ID: Your student id (e.g. s3823236)
 Created  date: dd/mm/yyyy (e.g. 28/08/2022)
 Last modified: dd/mm/yyyy (e.g. 28/08/2022)
 Acknowledgement: https://stackoverflow.com/questions/56969309/change-tabbed-view-bar-color-swiftui
 */

import SwiftUI

struct LaunchView: View {
    // Environment object to get the playermodel
    @EnvironmentObject var playerModel:PlayerModel

    // State variable to detect and show by condition
    @State var name:String = ""
    @State var showAlert = false
    @State var isToggleExplore:Bool = false
    // Custom tabbar
    init() {
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = UIColor(Color("Background").opacity(0.9))
        UITabBar.appearance().scrollEdgeAppearance = appearance
        UITabBar.appearance().unselectedItemTintColor = UIColor(.white)
        UITabBar.appearance().barTintColor = UIColor(Color("primary"))
    }
    var body: some View {
        GeometryReader {
            geo in
            VStack(spacing:35){
                VStack(spacing:20){
                    Text("CHINESE POKER").font(.title).foregroundColor(.white)
                    Image("home_image2").resizable().aspectRatio(contentMode: .fit)
                }.padding()
                VStack{
                    Text("Please enter your name before play the game").foregroundColor(.white)
                    // Get user input
                    TextField("", text: $name)
                        .padding()
                        .disableAutocorrection(true)
                        .frame(height: 50.0)
                        .foregroundColor(.white)
                    
                        .background(Color("ButtonBackground"))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                        )
                }
                // If the name is not empty -> show full screen cover start view
                if name !=  "" {
                    Button {
                        playSound(sound: "ClickButton", type: "mp3")
                        playerModel.findPlayerByName(name: name)
                        isToggleExplore = true
                    } label: {
                        ZStack {
                            Rectangle().foregroundColor(Color("primary")).clipShape(Capsule()).frame(width: geo.size.width/2.3, height: geo.size.height/12).shadow(color: .white, radius: 3)
                            Text("EXPLORE").foregroundColor(.white).font(.system(size: 23))
                        }
                    }
                    .fullScreenCover(isPresented: $isToggleExplore) {
                        StartView(name:name)
                    }
                }
                // If not -> show the alert
                else {
                    Button {
                        playSound(sound: "ClickButton", type: "mp3")
                        showAlert = true
                    } label: {
                        ZStack {
                            Rectangle().foregroundColor(Color("primary").opacity(0.4)).clipShape(Capsule()).frame(width: geo.size.width/2.3, height: geo.size.height/12).shadow(color: .white, radius: 3)
                            Text("EXPLORE").foregroundColor(.white).font(.system(size: 23))
                        } .alert(isPresented: $showAlert) {
                            Alert(title: Text("IMPORTANT"), message: Text("Please enter your name"), dismissButton: .default(Text("Accept it!")))
                        }
                    }
                }
                
                Spacer()
            }.padding()
        }.background(Color("Background")).onAppear {
            print(name)
            
        }.onAppear {
            // Load the backgorund music
            backgroundMusicPlayer.shared.startBackgroundMusic(sound: "MainView", type: "wav")
            audioPlayer?.stop()
            // Animate the view
            withAnimation(.easeIn(duration: 5.0)){
            }
            // Testing purposes
            //      playerModel.removeAll()
        }
        
    }
    
}



struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView().environmentObject(PlayerModel())
    }
}
