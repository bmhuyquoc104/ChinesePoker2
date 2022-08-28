//
//  RankHandPlayerView.swift
//  ChinesePoker2
//
//  Created by Võ Quốc Huy on 28/08/2022.
//

import SwiftUI

struct RankHandPlayerView: View {
    @Binding var isShowFrontHandResult:Bool
    @Binding var isShowMiddleHandResult:Bool
    @Binding var isShowBackHandResult:Bool
    
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
                if (isShowFrontHandResult){
                    Text("$\(frontHandProfit)").foregroundColor(frontHandRank > 0 ? Color("secondary") : Color("primary")).font(.system(size: 23))
                }
                if isShowMiddleHandResult{
                    Text("$\(secondHandProfit)").foregroundColor(secondHandRank > 0 ? Color("secondary") : Color("primary")).font(.system(size: 23))
                }
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
