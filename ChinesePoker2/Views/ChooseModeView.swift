//
//  ChooseModeView.swift
//  ChinesePoker2
//
//  Created by Võ Quốc Huy on 26/08/2022.
//

import SwiftUI

struct ChooseModeView: View {
    @State private var betAmount: Double = 0
    @State private var mode = "Easy"
    @State private var modeIndex = 0
    @Binding var isShowMode:Bool
    let modes = ["Easy","Medium","Hard"]

    var width: CGFloat
    var height: CGFloat
    
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
                                isShowMode = false
                            } label: {
                                Image(systemName: "xmark.circle").resizable().aspectRatio(contentMode: .fit).foregroundColor(Color("primary")).frame(width: 40, height: 40)
                            }

                        }.padding(.trailing).padding(.vertical,20)
                            HStack{
                                Text("🏆").font(.system(size: 30))
                                Text("Level").foregroundColor(.white)
                                Spacer()
                                Text("Professional").foregroundColor(.white)
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
                                Text("\(betAmount, specifier: "%.1f")").foregroundColor(.white)
                            }.padding()
                            Slider(value: $betAmount, in: 100...1000).padding(.horizontal)
                        }
                        HStack{
                            Spacer()
                            Button {
                                print("huy")
                            } label: {
                                ZStack{
                                    Rectangle().foregroundColor(Color("primary")).clipShape(Capsule()).frame(width: geo.size.width/2.5, height: geo.size.height/12).shadow(color: .white, radius: 3)
                                    Text("PLAY").foregroundColor(.white).font(.system(size: 23))
                                }
                                
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

            }
        }
            }
        
    }
    
//    struct ChooseModeView_Previews: PreviewProvider {
//        static var previews: some View {
//            ChooseModeView(isShowMode:true,width:400,height:400)
//        }
//    }
