//
//  Button.swift
//  ChinesePoker2
//
//  Created by Võ Quốc Huy on 28/08/2022.
//

import SwiftUI

struct ButtonView: View {
    var width: CGFloat
    var height: CGFloat
    var text:String
    var color:String
    
    var body: some View {
        ZStack(alignment:.center){
            Rectangle().foregroundColor(Color(color)).clipShape(RoundedRectangle(cornerRadius: 10)).frame(width: width, height: height).shadow(color: .white, radius: 5)
            Text(text).foregroundColor(.white).font(.system(size: 18))
        }
    }
}




//struct Button_Previews: PreviewProvider {
//    static var previews: some View {
//        Button(width: 10, height: 20, text: <#T##String#>, color: <#T##String#>)
//    }
//}
