//
//  ContentView.swift
//  ChinesePoker2
//
//  Created by Võ Quốc Huy on 22/08/2022.
//

import SwiftUI

struct PlayView: View {
    @EnvironmentObject var model: CardModel
    var body: some View {
        VStack (alignment:.leading){
            HStack {
                ForEach(0 ..< model.cards.count, id: \.self){
                    index in
                    if (index < 3){
                        let arr:[Card] = [model.cards[0],model.cards[1],model.cards[2]]
                        let handType = "\(model.evaluateHand(cards: arr))"
                        Image(model.cards[index].image)
                            .resizable()
                            .scaledToFit()
                            .onDrag {
                                model.currentCard = model.cards[index]
                                return NSItemProvider(contentsOf: URL(string: "\(model.cards[index].id)")!)!
                            }
                            .onDrop(of: [.url], delegate: DropViewDelegate(card: model.cards[index],models: model))
                    }
                }
            }
            HStack {
                ForEach(0 ..< model.cards.count, id: \.self){
                    index in
                    if (index >= 3 && index < 8 ){
                        let arr:[Card] = [model.cards[3],model.cards[4],model.cards[5],model.cards[6],model.cards[7]]
                        let handType = "\(model.evaluateHand(cards: arr))"
                        Text(handType)
                        Image(model.cards[index].image)
                            .resizable()
                            .scaledToFit()
                            .onDrag {
                                model.currentCard = model.cards[index]
                                return NSItemProvider(contentsOf: URL(string: "\(model.cards[index].id)")!)!
                            }
                            .onDrop(of: [.url], delegate: DropViewDelegate(card: model.cards[index],models: model))
                    }
                }
            }
            HStack {
                ForEach(0 ..< model.cards.count, id: \.self){
                    index in
                    if (index >= 8 && index < 13 ){
                        let arr:[Card] = [model.cards[8],model.cards[9],model.cards[10],model.cards[11],model.cards[12]]
                        let handType = "\(model.evaluateHand(cards: arr))"
                        Text(handType)
                        Image(model.cards[index].image)
                            .resizable()
                            .scaledToFit()
                            .onDrag {
                                model.currentCard = model.cards[index]
                                return NSItemProvider(contentsOf: URL(string: "\(model.cards[index].id)")!)!
                            }
                            .onDrop(of: [.url], delegate: DropViewDelegate(card: model.cards[index],models: model))
                    }
                }
            }
            
            Button("Shuffle"){
                model.cards.shuffle()
                
            }
        }.frame(width: 500, height: 300)
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView()
            .previewLayout(.fixed(width: 844, height: 390))
    }
}
