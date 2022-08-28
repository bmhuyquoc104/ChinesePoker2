//
//  LaunchView.swift
//  ChinesePoker2
//
//  Created by Võ Quốc Huy on 28/08/2022.
//

import SwiftUI

struct LaunchView: View {
    @State var name:String = ""
    @EnvironmentObject var playerModel:PlayerModel
    @State var isToggleExplore:Bool = false
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
                        Image("home_image1").resizable().aspectRatio(contentMode: .fit)
                    }.padding()
                    VStack{
                        Text("Please choose your name before play the game").foregroundColor(.white)

                        TextField("Enter username...", text: $name)
                            .padding()
                            .frame(height: 50.0)
                                      .foregroundColor(.white)
                                      .background(Color("ButtonBackground"))
                                      .overlay(
                                          RoundedRectangle(cornerRadius: 10)
                                              .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                                      )
                    }
              
               
                    
                    
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
                    Spacer()
                }.padding()
        }.background(Color("Background")).onAppear {
            print(name)

        }

    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView().environmentObject(PlayerModel())
    }
}
