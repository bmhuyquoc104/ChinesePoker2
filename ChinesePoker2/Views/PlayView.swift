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
