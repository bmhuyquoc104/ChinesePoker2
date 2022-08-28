//
//  HomeView.swift
//  ChinesePoker2
//
//  Created by Võ Quốc Huy on 25/08/2022.
//

import SwiftUI
import AVFoundation


struct HomeView: View {

    @State private var isShowMainView = false
    @State private var isShowRule = false
    @State private var isShowSetting = false
    @State private var isShowMode = false
    
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
                        
                        Button {
                            print("huy")
                        } label: {
                            Image(systemName: "gearshape.circle").resizable().aspectRatio(contentMode: .fit).frame(width: 40, height: 40).foregroundColor(Color("ButtonBackground")).shadow(color: Color.white.opacity(0.7), radius: 5, x: 1, y: 1)
                        }
                        Spacer()
                        
                        Button {
                            isShowRule = true
                        } label: {
                            Image(systemName: "questionmark.circle.fill").resizable().aspectRatio(contentMode: .fit).frame(width: 40, height: 40).foregroundColor(Color("ButtonBackground")).shadow(color: Color.white.opacity(0.7), radius: 5, x: 1, y: 1)
                        }
                        .sheet(isPresented: $isShowRule){
                            RuleView()
                        }
                    }.padding()
                    VStack(spacing:20){
                        Text("CHINESE POKER").font(.title).foregroundColor(Color("secondary"))
                        Image("home_image1").resizable().aspectRatio(contentMode: .fit)
                    }.padding()
                    Button {
                        isShowMode = true
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
            
//            .onDisappear{
//                audioPlayer?.stop()
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
