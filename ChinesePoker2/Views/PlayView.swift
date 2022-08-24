//
//  ContentView.swift
//  ChinesePoker2
//
//  Created by Võ Quốc Huy on 22/08/2022.
//

import SwiftUI

struct PlayView: View {
    @EnvironmentObject var model: CardModel
    @EnvironmentObject var playerModel:ChinesePokerGameModel
    @State var isValidHandFrontHand:Bool = false
    @State var isValidHandMiddleHand:Bool = false
    @State var isValidHandBackHand:Bool = false
    
    var body: some View {
        VStack (alignment:.leading){
            VStack{
                if (isValidHandFrontHand && isValidHandMiddleHand && isValidHandBackHand) {
                    Text("Good")
                }
                else{
                    Text("Not Good")
                }
                
            }
            // MAKR: FRONT HAND
            GeometryReader {
                geo in
                HStack {
                    VStack{
                        if isValidHandFrontHand {
                            Image(systemName: "hand.thumbsup.fill").resizable().frame(width: 18, height: 18)
                        }
                        else{
                            Image(systemName: "hand.thumbsdown.fill").resizable().frame(width: 18, height: 18)
                        }
                    }
                    ZStack (alignment:.bottomLeading) {
                        HStack {
                            let frontHand = "\(model.frontHandValue)"
                            Text(frontHand)
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
                            
                            .onAppear {
                                model.evaluateFrontHand(cards: [playerModel.players[4].playerCards[0],playerModel.players[4].playerCards[1],playerModel.players[4].playerCards[2]])
                            }
                            .onChange(of: model.cards) { newValue in
                                model.evaluateFrontHand(cards: [model.cards[0],model.cards[1],model.cards[2]])
                            }
                        }
                        ZStack(alignment:.leading){
                            Rectangle().foregroundColor(.black).opacity(0.7).frame(width: geo.size.width/2.5, height: geo.size.height/2.7).shadow(radius: 0.5)
                            let arr:Stack = [model.cards[0],model.cards[1],model.cards[2]]
                            let handType = "\(model.evaluateHand(cards: arr))"
                            if (handType == "StraighFlush"){
                                Text(handType).font(.title3).foregroundColor(.yellow).padding(.leading)
                            }
                            else{
                                Text(handType).font(.title3).foregroundColor(.green).padding(.leading)
                            }
                        }
                        
                    }
                }
            }
            // MARK: MIDDLE HAND
            GeometryReader {
                geo in
                HStack {
                    VStack{
                        if isValidHandMiddleHand {
                            Image(systemName: "hand.thumbsup.fill").resizable().frame(width: 18, height: 18)
                        }
                        else{
                            Image(systemName: "hand.thumbsdown.fill").resizable().frame(width: 18, height: 18)
                        }
                    }
                    ZStack (alignment:.bottomLeading) {
                        HStack {
                            let middleHand = "\(model.middleHandValue)"
                            Text(middleHand)
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
                            .onChange(of: model.cards) { newValue in
                                model.evaluateMiddleHand(cards: [model.cards[3],model.cards[4],model.cards[5],model.cards[6],model.cards[7]])
                            }
                            .onAppear{
                                model.evaluateMiddleHand(cards: [model.cards[3],model.cards[4],model.cards[5],model.cards[6],model.cards[7]])
                            }
                            
                        }
                        ZStack(alignment:.leading){
                            Rectangle().foregroundColor(.black).opacity(0.7).frame(width: geo.size.width/2.5, height: geo.size.height/2.7).shadow(radius: 0.5)
                            let arr:[Card] = [model.cards[3],model.cards[4],model.cards[5],model.cards[6],model.cards[7]]
                            let handType = "\(model.evaluateHand(cards: arr))"
                            if (handType == "StraighFlush"){
                                Text(handType).font(.title3).foregroundColor(.yellow).padding(.leading)
                            }
                            else{
                                Text(handType).font(.title3).foregroundColor(.green).padding(.leading)
                                
                            }
                        }
                    }
                }
            }
            // MARK: BACK HAND
            GeometryReader {
                geo in
                HStack {
                    VStack{
                        if isValidHandBackHand {
                            Image(systemName: "hand.thumbsup.fill").resizable().frame(width: 18, height: 18)
                        }
                        else{
                            Image(systemName: "hand.thumbsdown.fill").resizable().frame(width: 18, height: 18)
                        }
                    }
                    ZStack (alignment:.bottomLeading) {
                        HStack {
                            let backHand = "\(model.backHandValue)"
                            Text(backHand)
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
                            .onChange(of: model.cards) { newValue in
                                model.evaluateBackHand(cards: [model.cards[8],model.cards[9],model.cards[10],model.cards[11],model.cards[12]])
                            }
                            .onAppear{
                                model.evaluateBackHand(cards: [model.cards[8],model.cards[9],model.cards[10],model.cards[11],model.cards[12]])
                            }
                        }
                        ZStack(alignment:.leading){
                            Rectangle().foregroundColor(.black).opacity(0.7).frame(width: geo.size.width/2.5, height: geo.size.height/2.7).shadow(radius: 0.5)
                            let arr:[Card] = [model.cards[8],model.cards[9],model.cards[10],model.cards[11],model.cards[12]]
                            let handType = "\(model.evaluateHand(cards: arr))"
                            if (handType == "StraighFlush"){
                                Text(handType).font(.title3).foregroundColor(.yellow).padding(.leading)
                            }
                            else{
                                Text(handType).font(.title3).foregroundColor(.green).padding(.leading)
                                
                            }
                        }
                    }
                }
            }
        }.frame(width: 500, height: 300)
            .onAppear {
                model.evaluateFrontHand(cards: [model.cards[0],model.cards[1],model.cards[2]])
                model.evaluateBackHand(cards: [model.cards[8],model.cards[9],model.cards[10],model.cards[11],model.cards[12]])
                model.evaluateMiddleHand(cards: [model.cards[3],model.cards[4],model.cards[5],model.cards[6],model.cards[7]])
                let arr:Stack = [model.cards[0],model.cards[1],model.cards[2]]
                let arr2:Stack = [model.cards[3],model.cards[4],model.cards[5],model.cards[6],model.cards[7]]
                let arr3:Stack = [model.cards[8],model.cards[9],model.cards[10],model.cards[11],model.cards[12]]
                if (model.frontHandValue == model.middleHandValue && model.frontHandValue == 1){
                    let temp = [arr[0].rank.rawValue,arr[1].rank.rawValue,arr[2].rank.rawValue]
                    let temp2 = [arr2[0].rank.rawValue,arr2[1].rank.rawValue,arr2[2].rank.rawValue]

                    var isValid = false
                    for (e1, e2) in zip(temp, temp2) {
                        if (e1 > e2 ) {
                            isValid = false
                            break
                        }
                        else{
                            isValid = true
                        }
                    }
                    if (isValid){
                        isValidHandFrontHand = true
                        isValidHandBackHand = true
                        isValidHandMiddleHand = true
                    }
                    else{
                        isValidHandFrontHand = false
                        isValidHandBackHand = true
                        isValidHandMiddleHand = false
                    }
                }
                
                
                if (model.frontHandValue == model.middleHandValue && model.frontHandValue == 2){
                    let mappedItems = arr.map { ($0.rank.rawValue, 1) }
                    let counts = Dictionary(mappedItems, uniquingKeysWith: +)
                    let sortedByValueDictionary = counts.sorted { $0.1 > $1.1 }
                    let mappedItems2 = arr2.map { ($0.rank.rawValue, 1) }
                    let counts2 = Dictionary(mappedItems2, uniquingKeysWith: +)
                    let sortedByValueDictionary2 = counts2.sorted { $0.1 > $1.1 }
                    let remainValue = [sortedByValueDictionary[1].key]
                    var remainValue2 = [sortedByValueDictionary2[1].key,sortedByValueDictionary2[2].key,sortedByValueDictionary2[3].key]
                    remainValue2.sort(by: >)
                    if (sortedByValueDictionary[0] <= sortedByValueDictionary2[0] && remainValue[0] <= remainValue2[0]){
                        isValidHandFrontHand = true
                        isValidHandBackHand = true
                        isValidHandMiddleHand = true
                    }
                    else{
                        isValidHandFrontHand = false
                        isValidHandBackHand = true
                        isValidHandMiddleHand = false
                    }
                }
                
                
                 if (model.frontHandValue == model.middleHandValue && model.frontHandValue == 4){
                    let mappedItems = arr.map { ($0.rank.rawValue, 1) }
                    let counts = Dictionary(mappedItems, uniquingKeysWith: +)
                    let sortedByValueDictionary = counts.sorted { $0.1 > $1.1 }
                    let mappedItems2 = arr2.map { ($0.rank.rawValue, 1) }
                    let counts2 = Dictionary(mappedItems2, uniquingKeysWith: +)
                    let sortedByValueDictionary2 = counts2.sorted { $0.1 > $1.1 }
                    print(sortedByValueDictionary)
                    print(sortedByValueDictionary2)
                    if (sortedByValueDictionary[0] <= sortedByValueDictionary2[0]){
                        isValidHandFrontHand = true
                        isValidHandBackHand = true
                        isValidHandMiddleHand = true
                    }
                    else{
                        isValidHandFrontHand = false
                        isValidHandBackHand = true
                        isValidHandMiddleHand = false
                    }
                }
                
                // MARK: Check if back hand = midlle hand and hand type =  High Card || Flush
                 if (model.middleHandValue == model.backHandValue && model.middleHandValue == 1 ||
                     model.middleHandValue == model.backHandValue && model.middleHandValue == 6){
                    let mappedItems = arr2.map { ($0.rank.rawValue, 1) }
                    let counts = Dictionary(mappedItems, uniquingKeysWith: +)
                    let sortedByValueDictionary = counts.sorted { $0.1 > $1.1 }
                    let mappedItems2 = arr3.map { ($0.rank.rawValue, 1) }
                    let counts2 = Dictionary(mappedItems2, uniquingKeysWith: +)
                    let sortedByValueDictionary2 = counts2.sorted { $0.1 > $1.1 }
                     var remainValue = [sortedByValueDictionary[0].key,sortedByValueDictionary[1].key,sortedByValueDictionary[2].key,sortedByValueDictionary[3].key]
                    remainValue.sort(by: >)
                    var remainValue2 = [sortedByValueDictionary2[0].key,sortedByValueDictionary2[1].key,sortedByValueDictionary2[2].key,sortedByValueDictionary2[3].key]
                    remainValue2.sort(by: >)
                    var isValid = false
                    for (e1, e2) in zip(remainValue, remainValue2) {
                        if (e1 > e2 ) {
                            isValid = false
                            break
                        }
                        else{
                            isValid = true
                        }
                    }
                    if (isValid){
                        isValidHandFrontHand = true
                        isValidHandBackHand = true
                        isValidHandMiddleHand = true
                    }
                    else{
                        isValidHandFrontHand = false
                        isValidHandBackHand = true
                        isValidHandMiddleHand = false
                    }
                }
                
                // MARK: Check if back hand = midlle hand and hand type =  PAIR
                 if (model.middleHandValue == model.backHandValue && model.middleHandValue == 2){
                    let mappedItems = arr2.map { ($0.rank.rawValue, 1) }
                    let counts = Dictionary(mappedItems, uniquingKeysWith: +)
                    let sortedByValueDictionary = counts.sorted { $0.1 > $1.1 }
                    let mappedItems2 = arr3.map { ($0.rank.rawValue, 1) }
                    let counts2 = Dictionary(mappedItems2, uniquingKeysWith: +)
                    let sortedByValueDictionary2 = counts2.sorted { $0.1 > $1.1 }
                    var remainValue = [sortedByValueDictionary[1].key,sortedByValueDictionary[2].key,sortedByValueDictionary[3].key]
                    remainValue.sort(by: >)
                    var remainValue2 = [sortedByValueDictionary2[1].key,sortedByValueDictionary2[2].key,sortedByValueDictionary2[3].key]
                    remainValue2.sort(by: >)
                    var isValid = false
                    for (e1, e2) in zip(remainValue, remainValue2) {
                        if (e1 > e2 ) {
                            isValid = false
                            break
                        }
                        else{
                            isValid = true
                        }
                    }
                    print(isValid)
                    if (sortedByValueDictionary[0] <= sortedByValueDictionary2[0]
                        && isValid){
                        isValidHandFrontHand = true
                        isValidHandBackHand = true
                        isValidHandMiddleHand = true
                    }
                    else{
                        isValidHandFrontHand = true
                        isValidHandBackHand = false
                        isValidHandMiddleHand = false
                    }
                }
                
                // MARK: Check if back hand = midlle hand and hand type =  TWO PAIR
                if (model.middleHandValue == model.backHandValue && model.middleHandValue == 3){
                   let mappedItems = arr2.map { ($0.rank.rawValue, 1) }
                   let counts = Dictionary(mappedItems, uniquingKeysWith: +)
                   let sortedByValueDictionary = counts.sorted { $0.1 > $1.1 }
                   let mappedItems2 = arr3.map { ($0.rank.rawValue, 1) }
                   let counts2 = Dictionary(mappedItems2, uniquingKeysWith: +)
                   let sortedByValueDictionary2 = counts2.sorted { $0.1 > $1.1 }
                    var temp1 = [sortedByValueDictionary[0].key,sortedByValueDictionary[1].key]
                    temp1.sort(by: >)
                    var temp2 = [sortedByValueDictionary2[0].key,sortedByValueDictionary2[1].key]
                    temp2.sort(by: >)
                    var isValid = false
                    for (e1, e2) in zip(temp1, temp2) {
                        if (e1 > e2 ) {
                            isValid = false
                            break
                        }
                        else{
                            isValid = true
                        }
                    }
                   if (isValid && sortedByValueDictionary[2] <= sortedByValueDictionary2[2]){
                       isValidHandFrontHand = true
                       isValidHandBackHand = true
                       isValidHandMiddleHand = true
                   }
                   else{
                       isValidHandFrontHand = true
                       isValidHandBackHand = false
                       isValidHandMiddleHand = false
                   }
               }
                
                // MARK: Check if back hand = midlle hand and hand type =  Three of a kind
                if (model.middleHandValue == model.backHandValue && model.middleHandValue == 4){
                   let mappedItems = arr2.map { ($0.rank.rawValue, 1) }
                   let counts = Dictionary(mappedItems, uniquingKeysWith: +)
                   let sortedByValueDictionary = counts.sorted { $0.1 > $1.1 }
                   let mappedItems2 = arr3.map { ($0.rank.rawValue, 1) }
                   let counts2 = Dictionary(mappedItems2, uniquingKeysWith: +)
                   let sortedByValueDictionary2 = counts2.sorted { $0.1 > $1.1 }
                   var remainValue = [sortedByValueDictionary[1].key,sortedByValueDictionary[2].key]
                   remainValue.sort(by: >)
                   var remainValue2 = [sortedByValueDictionary2[1].key,sortedByValueDictionary2[2].key]
                   remainValue2.sort(by: >)
                   var isValid = false
                   for (e1, e2) in zip(remainValue, remainValue2) {
                       if (e1 > e2 ) {
                           isValid = false
                           break
                       }
                       else{
                           isValid = true
                       }
                   }
                   print(isValid)
                   if (sortedByValueDictionary[0] <= sortedByValueDictionary2[0]
                       && isValid){
                       isValidHandFrontHand = true
                       isValidHandBackHand = true
                       isValidHandMiddleHand = true
                   }
                   else{
                       isValidHandFrontHand = true
                       isValidHandBackHand = false
                       isValidHandMiddleHand = false
                   }
               }
                // MARK: Check if back hand = midlle hand and hand type =  Straight || StraightFlush
                if (model.middleHandValue == model.backHandValue && model.middleHandValue == 5 ||
                    model.middleHandValue == model.backHandValue && model.middleHandValue == 9){
                    if (arr2.sortByRank()[4].rank.rawValue <= arr3.sortByRank()[4].rank.rawValue){
                       isValidHandFrontHand = true
                       isValidHandBackHand = true
                       isValidHandMiddleHand = true
                   }
                   else{
                       isValidHandFrontHand = true
                       isValidHandBackHand = false
                       isValidHandMiddleHand = false
                   }
               }
                
                // MARK: Check if back hand = midlle hand and hand type =  Full House
                if (model.middleHandValue == model.backHandValue && model.middleHandValue == 7){
                    let mappedItems = arr2.map { ($0.rank.rawValue, 1) }
                    let counts = Dictionary(mappedItems, uniquingKeysWith: +)
                    let sortedByValueDictionary = counts.sorted { $0.1 > $1.1 }
                    let mappedItems2 = arr3.map { ($0.rank.rawValue, 1) }
                    let counts2 = Dictionary(mappedItems2, uniquingKeysWith: +)
                    let sortedByValueDictionary2 = counts2.sorted { $0.1 > $1.1 }
                  
                    if (sortedByValueDictionary[0] < sortedByValueDictionary2[0]){
                       isValidHandFrontHand = true
                       isValidHandBackHand = true
                       isValidHandMiddleHand = true
                   }
                   else{
                       isValidHandFrontHand = true
                       isValidHandBackHand = false
                       isValidHandMiddleHand = false
                   }
               }
                
                // MARK: Check if back hand = midlle hand and hand type =  Four of a kind
                if (model.middleHandValue == model.backHandValue && model.middleHandValue == 8){
                   let mappedItems = arr2.map { ($0.rank.rawValue, 1) }
                   let counts = Dictionary(mappedItems, uniquingKeysWith: +)
                   let sortedByValueDictionary = counts.sorted { $0.1 > $1.1 }
                   let mappedItems2 = arr3.map { ($0.rank.rawValue, 1) }
                   let counts2 = Dictionary(mappedItems2, uniquingKeysWith: +)
                   let sortedByValueDictionary2 = counts2.sorted { $0.1 > $1.1 }
                
                   if (sortedByValueDictionary[0] <= sortedByValueDictionary2[0]){
                       isValidHandFrontHand = true
                       isValidHandBackHand = true
                       isValidHandMiddleHand = true
                   }
                   else{
                       isValidHandFrontHand = true
                       isValidHandBackHand = false
                       isValidHandMiddleHand = false
                   }
               }
                
              
                if (model.frontHandValue < model.middleHandValue && model.middleHandValue < model.backHandValue){
                    isValidHandFrontHand = true
                    isValidHandBackHand = true
                    isValidHandMiddleHand = true
                }
                
                if (model.frontHandValue < model.middleHandValue && model.middleHandValue > model.backHandValue){
                    isValidHandFrontHand = true
                    isValidHandBackHand = false
                    isValidHandMiddleHand = false
                }
                if (model.frontHandValue > model.middleHandValue && model.middleHandValue < model.backHandValue){
                    isValidHandFrontHand = false
                    isValidHandBackHand = true
                    isValidHandMiddleHand = false
                }
            
            }
            .onChange(of: model.cards) { newValue in
                model.evaluateFrontHand(cards: [model.cards[0],model.cards[1],model.cards[2]])
                model.evaluateBackHand(cards: [model.cards[8],model.cards[9],model.cards[10],model.cards[11],model.cards[12]])
                model.evaluateMiddleHand(cards: [model.cards[3],model.cards[4],model.cards[5],model.cards[6],model.cards[7]])
                let arr:Stack = [model.cards[0],model.cards[1],model.cards[2]]
                let arr2:Stack = [model.cards[3],model.cards[4],model.cards[5],model.cards[6],model.cards[7]]
                let arr3:Stack = [model.cards[8],model.cards[9],model.cards[10],model.cards[11],model.cards[12]]
                if (model.frontHandValue == model.middleHandValue && model.frontHandValue == 1){
                    let temp = [arr[0].rank.rawValue,arr[1].rank.rawValue,arr[2].rank.rawValue]
                    let temp2 = [arr2[0].rank.rawValue,arr2[1].rank.rawValue,arr2[2].rank.rawValue]

                    var isValid = false
                    for (e1, e2) in zip(temp, temp2) {
                        if (e1 > e2 ) {
                            isValid = false
                            break
                        }
                        else{
                            isValid = true
                        }
                    }
                    if (isValid){
                        isValidHandFrontHand = true
                        isValidHandBackHand = true
                        isValidHandMiddleHand = true
                    }
                    else{
                        isValidHandFrontHand = false
                        isValidHandBackHand = true
                        isValidHandMiddleHand = false
                    }
                }
                
                
                if (model.frontHandValue == model.middleHandValue && model.frontHandValue == 2){
                    let mappedItems = arr.map { ($0.rank.rawValue, 1) }
                    let counts = Dictionary(mappedItems, uniquingKeysWith: +)
                    let sortedByValueDictionary = counts.sorted { $0.1 > $1.1 }
                    let mappedItems2 = arr2.map { ($0.rank.rawValue, 1) }
                    let counts2 = Dictionary(mappedItems2, uniquingKeysWith: +)
                    let sortedByValueDictionary2 = counts2.sorted { $0.1 > $1.1 }
                    let remainValue = [sortedByValueDictionary[1].key]
                    var remainValue2 = [sortedByValueDictionary2[1].key,sortedByValueDictionary2[2].key,sortedByValueDictionary2[3].key]
                    remainValue2.sort(by: >)
                    if (sortedByValueDictionary[0] <= sortedByValueDictionary2[0] && remainValue[0] <= remainValue2[0]){
                        isValidHandFrontHand = true
                        isValidHandBackHand = true
                        isValidHandMiddleHand = true
                    }
                    else{
                        isValidHandFrontHand = false
                        isValidHandBackHand = true
                        isValidHandMiddleHand = false
                    }
                }
                
                
                 if (model.frontHandValue == model.middleHandValue && model.frontHandValue == 4){
                    let mappedItems = arr.map { ($0.rank.rawValue, 1) }
                    let counts = Dictionary(mappedItems, uniquingKeysWith: +)
                    let sortedByValueDictionary = counts.sorted { $0.1 > $1.1 }
                    let mappedItems2 = arr2.map { ($0.rank.rawValue, 1) }
                    let counts2 = Dictionary(mappedItems2, uniquingKeysWith: +)
                    let sortedByValueDictionary2 = counts2.sorted { $0.1 > $1.1 }
                    print(sortedByValueDictionary)
                    print(sortedByValueDictionary2)
                    if (sortedByValueDictionary[0] <= sortedByValueDictionary2[0]){
                        isValidHandFrontHand = true
                        isValidHandBackHand = true
                        isValidHandMiddleHand = true
                    }
                    else{
                        isValidHandFrontHand = false
                        isValidHandBackHand = true
                        isValidHandMiddleHand = false
                    }
                }
                
                // MARK: Check if back hand = midlle hand and hand type =  High Card || Flush
                 if (model.middleHandValue == model.backHandValue && model.middleHandValue == 1 ||
                     model.middleHandValue == model.backHandValue && model.middleHandValue == 6){
                    let mappedItems = arr2.map { ($0.rank.rawValue, 1) }
                    let counts = Dictionary(mappedItems, uniquingKeysWith: +)
                    let sortedByValueDictionary = counts.sorted { $0.1 > $1.1 }
                    let mappedItems2 = arr3.map { ($0.rank.rawValue, 1) }
                    let counts2 = Dictionary(mappedItems2, uniquingKeysWith: +)
                    let sortedByValueDictionary2 = counts2.sorted { $0.1 > $1.1 }
                     var remainValue = [sortedByValueDictionary[0].key,sortedByValueDictionary[1].key,sortedByValueDictionary[2].key,sortedByValueDictionary[3].key,sortedByValueDictionary[4].key]
                    remainValue.sort(by: >)
                    var remainValue2 = [sortedByValueDictionary2[0].key,sortedByValueDictionary2[1].key,sortedByValueDictionary2[2].key,sortedByValueDictionary2[3].key,sortedByValueDictionary2[4].key]
                    remainValue2.sort(by: >)
                    var isValid = false
                    for (e1, e2) in zip(remainValue, remainValue2) {
                        if (e1 > e2 ) {
                            isValid = false
                            break
                        }
                        else{
                            isValid = true
                        }
                    }
                    if (isValid){
                        isValidHandFrontHand = true
                        isValidHandBackHand = true
                        isValidHandMiddleHand = true
                    }
                    else{
                        isValidHandFrontHand = true
                        isValidHandBackHand = false
                        isValidHandMiddleHand = false
                    }
                }
                
                // MARK: Check if back hand = midlle hand and hand type =  PAIR
                 if (model.middleHandValue == model.backHandValue && model.middleHandValue == 2){
                    let mappedItems = arr2.map { ($0.rank.rawValue, 1) }
                    let counts = Dictionary(mappedItems, uniquingKeysWith: +)
                    let sortedByValueDictionary = counts.sorted { $0.1 > $1.1 }
                    let mappedItems2 = arr3.map { ($0.rank.rawValue, 1) }
                    let counts2 = Dictionary(mappedItems2, uniquingKeysWith: +)
                    let sortedByValueDictionary2 = counts2.sorted { $0.1 > $1.1 }
                    var remainValue = [sortedByValueDictionary[1].key,sortedByValueDictionary[2].key,sortedByValueDictionary[3].key]
                    remainValue.sort(by: >)
                    var remainValue2 = [sortedByValueDictionary2[1].key,sortedByValueDictionary2[2].key,sortedByValueDictionary2[3].key]
                    remainValue2.sort(by: >)
                    var isValid = false
                    for (e1, e2) in zip(remainValue, remainValue2) {
                        if (e1 > e2 ) {
                            isValid = false
                            break
                        }
                        else{
                            isValid = true
                        }
                    }
                    print(isValid)
                    if (sortedByValueDictionary[0] <= sortedByValueDictionary2[0]
                        && isValid){
                        isValidHandFrontHand = true
                        isValidHandBackHand = true
                        isValidHandMiddleHand = true
                    }
                    else{
                        isValidHandFrontHand = true
                        isValidHandBackHand = false
                        isValidHandMiddleHand = false
                    }
                }
                
                // MARK: Check if back hand = midlle hand and hand type =  TWO PAIR
                if (model.middleHandValue == model.backHandValue && model.middleHandValue == 3){
                   let mappedItems = arr2.map { ($0.rank.rawValue, 1) }
                   let counts = Dictionary(mappedItems, uniquingKeysWith: +)
                   let sortedByValueDictionary = counts.sorted { $0.1 > $1.1 }
                   let mappedItems2 = arr3.map { ($0.rank.rawValue, 1) }
                   let counts2 = Dictionary(mappedItems2, uniquingKeysWith: +)
                   let sortedByValueDictionary2 = counts2.sorted { $0.1 > $1.1 }
                    var temp1 = [sortedByValueDictionary[0].key,sortedByValueDictionary[1].key]
                    temp1.sort(by: >)
                    var temp2 = [sortedByValueDictionary2[0].key,sortedByValueDictionary2[1].key]
                    temp2.sort(by: >)
                    var isValid = false
                    for (e1, e2) in zip(temp1, temp2) {
                        if (e1 > e2 ) {
                            isValid = false
                            break
                        }
                        else{
                            isValid = true
                        }
                    }
                   if (isValid && sortedByValueDictionary[2] <= sortedByValueDictionary2[2]){
                       isValidHandFrontHand = true
                       isValidHandBackHand = true
                       isValidHandMiddleHand = true
                   }
                   else{
                       isValidHandFrontHand = true
                       isValidHandBackHand = false
                       isValidHandMiddleHand = false
                   }
               }
                
                // MARK: Check if back hand = midlle hand and hand type =  Three of a kind
                if (model.middleHandValue == model.backHandValue && model.middleHandValue == 4){
                   let mappedItems = arr2.map { ($0.rank.rawValue, 1) }
                   let counts = Dictionary(mappedItems, uniquingKeysWith: +)
                   let sortedByValueDictionary = counts.sorted { $0.1 > $1.1 }
                   let mappedItems2 = arr3.map { ($0.rank.rawValue, 1) }
                   let counts2 = Dictionary(mappedItems2, uniquingKeysWith: +)
                   let sortedByValueDictionary2 = counts2.sorted { $0.1 > $1.1 }
                   var remainValue = [sortedByValueDictionary[1].key,sortedByValueDictionary[2].key]
                   remainValue.sort(by: >)
                   var remainValue2 = [sortedByValueDictionary2[1].key,sortedByValueDictionary2[2].key]
                   remainValue2.sort(by: >)
                   var isValid = false
                   for (e1, e2) in zip(remainValue, remainValue2) {
                       if (e1 > e2 ) {
                           isValid = false
                           break
                       }
                       else{
                           isValid = true
                       }
                   }
                   print(isValid)
                   if (sortedByValueDictionary[0] <= sortedByValueDictionary2[0]
                       && isValid){
                       isValidHandFrontHand = true
                       isValidHandBackHand = true
                       isValidHandMiddleHand = true
                   }
                   else{
                       isValidHandFrontHand = true
                       isValidHandBackHand = false
                       isValidHandMiddleHand = false
                   }
               }
                // MARK: Check if back hand = midlle hand and hand type =  Straight || StraightFlush
                if (model.middleHandValue == model.backHandValue && model.middleHandValue == 5 ||
                    model.middleHandValue == model.backHandValue && model.middleHandValue == 9){
                    if (arr2.sortByRank()[4].rank.rawValue <= arr3.sortByRank()[4].rank.rawValue){
                       isValidHandFrontHand = true
                       isValidHandBackHand = true
                       isValidHandMiddleHand = true
                   }
                   else{
                       isValidHandFrontHand = true
                       isValidHandBackHand = false
                       isValidHandMiddleHand = false
                   }
               }
                
                // MARK: Check if back hand = midlle hand and hand type =  Full House
                if (model.middleHandValue == model.backHandValue && model.middleHandValue == 7){
                    let mappedItems = arr2.map { ($0.rank.rawValue, 1) }
                    let counts = Dictionary(mappedItems, uniquingKeysWith: +)
                    let sortedByValueDictionary = counts.sorted { $0.1 > $1.1 }
                    let mappedItems2 = arr3.map { ($0.rank.rawValue, 1) }
                    let counts2 = Dictionary(mappedItems2, uniquingKeysWith: +)
                    let sortedByValueDictionary2 = counts2.sorted { $0.1 > $1.1 }
                  
                    if (sortedByValueDictionary[0] < sortedByValueDictionary2[0]){
                       isValidHandFrontHand = true
                       isValidHandBackHand = true
                       isValidHandMiddleHand = true
                   }
                   else{
                       isValidHandFrontHand = true
                       isValidHandBackHand = false
                       isValidHandMiddleHand = false
                   }
               }
                
                // MARK: Check if back hand = midlle hand and hand type =  Four of a kind
                if (model.middleHandValue == model.backHandValue && model.middleHandValue == 8){
                   let mappedItems = arr2.map { ($0.rank.rawValue, 1) }
                   let counts = Dictionary(mappedItems, uniquingKeysWith: +)
                   let sortedByValueDictionary = counts.sorted { $0.1 > $1.1 }
                   let mappedItems2 = arr3.map { ($0.rank.rawValue, 1) }
                   let counts2 = Dictionary(mappedItems2, uniquingKeysWith: +)
                   let sortedByValueDictionary2 = counts2.sorted { $0.1 > $1.1 }
                
                   if (sortedByValueDictionary[0] <= sortedByValueDictionary2[0]){
                       isValidHandFrontHand = true
                       isValidHandBackHand = true
                       isValidHandMiddleHand = true
                   }
                   else{
                       isValidHandFrontHand = true
                       isValidHandBackHand = false
                       isValidHandMiddleHand = false
                   }
               }
                
              
                if (model.frontHandValue < model.middleHandValue && model.middleHandValue < model.backHandValue){
                    isValidHandFrontHand = true
                    isValidHandBackHand = true
                    isValidHandMiddleHand = true
                }
                
                if (model.frontHandValue < model.middleHandValue && model.middleHandValue > model.backHandValue){
                    isValidHandFrontHand = true
                    isValidHandBackHand = false
                    isValidHandMiddleHand = false
                }
                if (model.frontHandValue > model.middleHandValue){
                    isValidHandFrontHand = false
                    isValidHandBackHand = true
                    isValidHandMiddleHand = false
                }
               
            }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView()
    }
}
