//
//  HomeView.swift
//  ChinesePoker2
//
//  Created by Võ Quốc Huy on 25/08/2022.
//

import SwiftUI

struct HomeView: View {
    @State private var isShowMainView = false
    @State private var isShowRule = false
    @State private var isShowSetting = false
    
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
                        isShowMainView = true
                    } label: {
                        ZStack {
                            Rectangle().foregroundColor(Color("primary")).clipShape(Capsule()).frame(width: geo.size.width/2.5, height: geo.size.height/12).shadow(color: .white, radius: 3)
                            Text("PLAY NOW").foregroundColor(.white).font(.system(size: 23))
                        }
                    }
                    .fullScreenCover(isPresented: $isShowMainView) {
                                        MainView()
                                        
                    }
                   

                    Spacer()

                }.padding()
                .background(Color("Background"))
            }.background(Color("Background"))
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
        HomeView().environment(
            \.colorScheme, .dark)
    }
}
