//
//  RuleView.swift
//  ChinesePoker2
//
//  Created by Võ Quốc Huy on 26/08/2022.
//

import SwiftUI

struct RuleView: View {
    let columns = [
        GridItem(.adaptive(minimum: 70))
    ]
    
    var body: some View {
        GeometryReader {
            geo in
            ScrollView{
                VStack(alignment:.leading,spacing:30){
                    HStack{
                        Spacer()
                        Text("HOW TO PLAY").font(.title).foregroundColor(Color("primary")).bold().padding()
                        Spacer()
                    }
                    VStack(alignment:.leading,spacing:20){
                        VStack(alignment:.leading,spacing:15){
                            Text("I. Dealing").font(.system(size: 20)).bold().foregroundColor(Color("secondary"))
                            Text("Each player will receive 13 random cards from the dealer in counter clock wise order.").foregroundColor(.white)
                            
                        }
                        
                        VStack (alignment:.leading,spacing:15){
                            Text("II. Setting").font(.system(size: 20)).bold().foregroundColor(Color("secondary"))
                            Text("Each player organizes their cards into three poker hands:").foregroundColor(.white)
                            Text("- One 3-card poker hand (the front).").padding(.leading).foregroundColor(.white)
                            Text("- Two 5-card hands (the middle and the back where they attempt to build the highest-ranking poker hands.").padding(.leading).foregroundColor(.white)
                            Text("- NOTE: The back must be the highest-ranked hand and the front must be the lowest-ranked hand of the three.").padding(.leading).foregroundColor(.white)
                        }
                        
                        VStack(alignment:.leading,spacing:15){
                            Text("III. Revealing of Hands.").font(.system(size: 20)).bold().foregroundColor(Color("secondary"))
                            Text("Players turn their cards face-up, exposing their front, middle, and back hands to compare and determine the highest-ranked to lowest-ranked hand hand.").foregroundColor(.white)
                        }
                        VStack(alignment:.leading,spacing:15){
                            Text("IV. Scoring").font(.system(size: 20)).bold().foregroundColor(Color("secondary"))
                            Text("This part is where winning hands are determined.").foregroundColor(.white)
                            Text("The player has the highest-ranked hand win double ammount of the bet.").foregroundColor(.white)
                            Text("The player has the second highest-ranked hand win equal of the bet.").foregroundColor(.white)
                            Text("The player has the lowest-ranked hand lose double ammount of the bet.").foregroundColor(.white)
                            Text("The player has the second loweset-ranked hand lose double ammount of the bet.").foregroundColor(.white)
                        }
                        VStack(alignment:.leading,spacing:15){
                            Text("V. Next Hand").font(.system(size: 20)).bold().foregroundColor(Color("secondary"))
                            Text("After compare the current hand and all points being awarded, the player press compare button to move to the next hand.").foregroundColor(.white)
                        }
                        
                        VStack(alignment:.leading,spacing:15){
                            Text("VI. End game").font(.system(size: 20)).bold().foregroundColor(Color("secondary"))
                            Text("After comparing all hands, the player see the result (winning or losing amount of bet).").foregroundColor(.white)
                            Text("Player can play again or leave the table.").foregroundColor(.white)
                        }
                        
                        VStack(alignment:.leading,spacing:15){
                            Text("VII. Card Ranking in descending order").font(.system(size: 20)).bold().foregroundColor(Color("secondary"))
                            LazyVGrid(columns:columns){
                                Group{
                                    Image("Spade Ace").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                    Image("Spade King").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                    Image("Spade Jack").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                    Image("Spade Queen").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                }
                                
                                Group{
                                    Image("Spade Ten").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                    Image("Spade Nine").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                    Image("Spade Eight").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                    Image("Spade Seven").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                    Image("Spade Six").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                }
                                
                                Group{
                                    Image("Spade Five").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                    Image("Spade Four").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                    Image("Spade Three").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                    Image("Spade Two").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                }
                                
                            }
                        }
                        
                        VStack(alignment:.leading,spacing:15){
                            Text("VIII. Hand Ranking in descending order").font(.system(size: 20)).bold().foregroundColor(Color("secondary"))
                            Group{
                                VStack(alignment:.leading,spacing:5){
                                    Text("• Royal Flush: Straight in same suit and the lowest card must be 10").foregroundColor(.white)
                                    HStack(spacing:-10){
                                        Spacer()
                                        Image("Spade Ten").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                        Image("Spade Jack").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                        Image("Spade Queen").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                        Image("Spade King").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                        Image("Spade Ace").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                        Spacer()
                                    }.padding()
                                }
                                VStack(alignment:.leading,spacing:5){
                                    Text("• Straight Flush: Straight in same suit").foregroundColor(.white)
                                    HStack(spacing:-10){
                                        Spacer()
                                        Image("Spade Nine").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                        Image("Spade Ten").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                        Image("Spade Jack").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                        Image("Spade Queen").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                        Image("Spade King").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                        Spacer()
                                    }.padding()
                                }
                                VStack(alignment:.leading,spacing:5){
                                    Text("• Four of a kind: Four card has the same rank").foregroundColor(.white)
                                    HStack(spacing:-10){
                                        Spacer()
                                        Image("Spade Ace").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                        Image("Club Ace").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                        Image("Diamond Ace").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                        Image("Heart Ace").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                        Image("Spade King").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                        Spacer()
                                    }.padding()
                                }
                                VStack(alignment:.leading,spacing:5){
                                    Text("• Full House: Three of one, two of the other").foregroundColor(.white)
                                    HStack(spacing:-10){
                                        Spacer()
                                        Image("Spade Ace").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                        Image("Club Ace").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                        Image("Diamond Ace").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                        Image("Spade King").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                        Image("Club King").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                        Spacer()
                                    }.padding()
                                }
                                VStack(alignment:.leading,spacing:5){
                                    Text("• Flush: All cards has same suit").foregroundColor(.white)
                                    HStack(spacing:-10){
                                        Spacer()
                                        Image("Spade Ace").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                        Image("Spade King").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                        Image("Spade Ten").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                        Image("Spade Eight").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                        Image("Spade Three").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                        Spacer()
                                    }.padding()
                                }
                            }
                            Group{
                                VStack(alignment:.leading,spacing:5){
                                    Text("• Straight: All cards are consecutive (various suit)").foregroundColor(.white)
                                    HStack(spacing:-10){
                                        Spacer()
                                        Image("Club Ten").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                        Image("Heart Jack").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                        Image("Diamond Queen").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                        Image("Spade King").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                        Image("Club Ace").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                        Spacer()
                                    }.padding()
                                }
                                VStack(alignment:.leading,spacing:5){
                                    Text("• Three of a kind: Three card has the same rank").foregroundColor(.white)
                                    HStack(spacing:-10){
                                        Spacer()
                                        Image("Spade Ace").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                        Image("Club Ace").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                        Image("Diamond Ace").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                        Image("Spade Two").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                        Image("Spade Five").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                        Spacer()
                                    }.padding()
                                }
                                VStack(alignment:.leading,spacing:5){
                                    Text("• Two Pairs:").foregroundColor(.white)
                                    HStack(spacing:-10){
                                        Spacer()
                                        Image("Spade Ace").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                        Image("Club Ace").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                        Image("Spade King").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                        Image("Club King").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                        Image("Spade Queen").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                        Spacer()
                                    }.padding()
                                }
                                VStack(alignment:.leading,spacing:5){
                                    Text("• Pair:").foregroundColor(.white)
                                    HStack(spacing:-10){
                                        Spacer()
                                        Image("Spade Ace").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                        Image("Club Ace").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                        Image("Heart Five").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                        Image("Diamond Four").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                        Image("Club Two").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                        Spacer()
                                    }.padding()
                                }
                                VStack(alignment:.leading,spacing:5){
                                    Text("• High Card: Different suits, non-connected, unpaired").foregroundColor(.white)
                                    HStack(spacing:-10){
                                        Spacer()
                                        Image("Spade Ace").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                        Image("Club Nine").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                        Image("Heart Seven").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                        Image("Spade Six").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                        Image("Heart Two").resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                                        Spacer()
                                    }.padding()
                                }
                            }
                            
                        }
                        
                    }
                }.padding()
                
            }
        }.background(Color("Background"))
    }
}


struct RuleView_Previews: PreviewProvider {
    static var previews: some View {
        RuleView()
        RuleView().environment(\.colorScheme, .dark)
        
    }
}
