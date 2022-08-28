//
//  PlayerAvatarView.swift
//  ChinesePoker2
//
//  Created by Võ Quốc Huy on 28/08/2022.
//

import SwiftUI

struct PlayerAvatarView: View {
    var width:CGFloat
    var height:CGFloat
    var name:String
    var image:String
    var money:Int
    var alignment:Alignment
    
    var body: some View {
        ZStack(alignment:alignment){
            Rectangle().foregroundColor(Color("Table")).frame(width: width/7*2.2, height: height/16).clipShape(Capsule())
                .opacity(0.8)
            HStack(){
                VStack{
                    Text(name).foregroundColor(.red).font(.system(size: 13))
                    if let score = money{
                        Text("$\(score)").foregroundColor(.yellow).font(.system(size: 13))
                    }
                }
                Image(image).resizable().aspectRatio(contentMode: .fit)
                    .frame(width: width/8, height: height/16)
                    .clipShape(Circle())
            }
        }
    }
}

//struct PlayerAvatarView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlayerAvatarView()
//    }
//}
