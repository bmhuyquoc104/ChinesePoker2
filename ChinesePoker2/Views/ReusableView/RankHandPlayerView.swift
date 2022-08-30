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

struct RankHandPlayerView: View {
    // Binding variable to update these variables from other views
    @Binding var isShowFrontHandResult:Bool
    @Binding var isShowMiddleHandResult:Bool
    @Binding var isShowBackHandResult:Bool
    
    // Variable requires to pass from other views
    var frontHandProfit:Int
    var secondHandProfit:Int
    var thirdHandProfit:Int
    
    var frontHandRank:Int
    var secondHandRank:Int
    var thirdHandRank:Int
    
    var body: some View {
        HStack{
            Spacer()
            VStack{
                // Render the color of text base on the front hand result
                if (isShowFrontHandResult){
                    Text("$\(frontHandProfit)").foregroundColor(frontHandRank > 0 ? Color("secondary") : Color("primary")).font(.system(size: 23))
                }
                // Render the color of text base on the middle hand result
                if isShowMiddleHandResult{
                    Text("$\(secondHandProfit)").foregroundColor(secondHandRank > 0 ? Color("secondary") : Color("primary")).font(.system(size: 23))
                }
                // Render the color of text base on the back hand result
                if isShowBackHandResult{
                    Text("$\(thirdHandProfit)").foregroundColor(thirdHandRank > 0 ? Color("secondary") : Color("primary")).font(.system(size: 23))
                }
            }
            Spacer()
            
        }
    }
}

//struct RankHandPlayerView_Previews: PreviewProvider {
//    static var previews: some View {
//        RankHandPlayerView()
//    }
//}
