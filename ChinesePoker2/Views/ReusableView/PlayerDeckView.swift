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



struct PlayerDeckView: View {
    // Variable requires to pass from other views
    var cards:Stack
    // Binding variable to update these variables from other views
    @Binding var showFrontHand:Bool
    @Binding var showMiddleHand:Bool
    @Binding var showBackHand:Bool
    // Variable requires to pass from other views
    var alignment:HorizontalAlignment
    
    var body: some View {
        VStack(alignment: alignment, spacing: -10){
            HStack(spacing:-30){
                ForEach(0..<cards.count,id: \.self){
                    index in
                    if index < 3 {
                        Image(showFrontHand ? cards[index].image : "card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 60, height: 60).animation( .easeInOut, value: showFrontHand)
                    }
                    
                }
                
            }
            HStack(spacing:-30){
                ForEach(0..<cards.count,id:\.self){
                    index in
                    if index >= 3 && index < 8{
                        Image(showMiddleHand ? cards[index].image : "card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 60, height: 60).animation( .easeInOut, value: showFrontHand)
                    }
                    
                }
                
            }
            HStack(spacing:-30){
                ForEach(0..<cards.count,id: \.self){
                    index in
                    if index > 7 && index < cards.count{
                        Image(showBackHand ? cards[index].image : "card_flip").resizable().aspectRatio(contentMode: .fit).frame(width: 60, height: 60).animation( .easeInOut, value: showFrontHand)
                    }
                    
                }
                
            }
        }
        
    }
}

//struct PlayerDeckView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlayerDeckView()
//    }
//}
