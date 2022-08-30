/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 2
 Author: Your name (e.g. Vo Quoc Huy)
 ID: Your student id (e.g. s3823236)
 Created  date: dd/mm/yyyy (e.g. 28/08/2022)
 Last modified: dd/mm/yyyy (e.g. 28/08/2022)
 */

import SwiftUI

struct PlayerAvatarView: View {
    // Variables requires to pass from other views
    var width:CGFloat
    var height:CGFloat
    var name:String
    var image:String
    var money:Int
    var alignment:Alignment
    
    var body: some View {
        ZStack(alignment:alignment){
            Rectangle().foregroundColor(Color("Table")).frame(width: width/7*2.5, height: height/16).clipShape(Capsule())
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
