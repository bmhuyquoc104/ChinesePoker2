//
//  ContentView.swift
//  ChinesePoker2
//
//  Created by Võ Quốc Huy on 22/08/2022.
//

import SwiftUI

struct PlayView: View {
    // Get the presentation mode from other views
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var model: CardModel
    @EnvironmentObject var playerModel:ChinesePokerGameModel
    @Binding var showFrontHand: Bool
    @Binding var isShowCompare: Bool
    @Binding var isShowArrange: Bool

    @State var isValidHandFrontHand:Bool = false
    @State var isValidHandMiddleHand:Bool = false
    @State var isValidHandBackHand:Bool = false
    
    var body: some View {
            GeometryReader{
                geo in
            VStack (alignment:.leading,spacing:0){
                VStack{
                    if (isValidHandFrontHand && isValidHandMiddleHand && isValidHandBackHand) {
                        Text("Good")
                    }
                    else{
                        Text("Not Good")
                    }
                    
                }
                    // MAKR: FRONT HAND
                HStack (spacing:0) {
                            VStack{
                                if isValidHandFrontHand {
                                    Image(systemName: "hand.thumbsup.fill").resizable().frame(width: 18, height: 18)
                                }
                                else{
                                    Image(systemName: "hand.thumbsdown.fill").resizable().frame(width: 18, height: 18)
                                }
                            }
                            ZStack (alignment:.bottomLeading) {
                                HStack(spacing:0) {
                                    let frontHand = "\(model.frontHandValue)"
                                    Text(frontHand)
                                    ForEach(0 ..< playerModel.players[3].playerCards.count, id: \.self){
                                        index in
                                        if (index < 3){
                                            
                                            Image(playerModel.players[3].playerCards[index].image)
                                                .resizable()
                                                .aspectRatio(contentMode: .fit).frame(width: 60)
                                                .onDrag {
                                                    model.currentCard = playerModel.players[3].playerCards[index]
                                                    return NSItemProvider(contentsOf: URL(string: "\(playerModel.players[3].playerCards[index].id)")!)!
                                                }
                                                .onDrop(of: [.url], delegate: DropViewDelegate(card: playerModel.players[3].playerCards[index],models: model,playerModel: playerModel))
                                        }
                                    }
                                    .onAppear {
                                        model.evaluateFrontHand(cards: [playerModel.players[3].playerCards[0],playerModel.players[3].playerCards[1],playerModel.players[3].playerCards[2]])
                                    }
                                    .onChange(of: playerModel.players[3].playerCards) { newValue in
                                        model.evaluateFrontHand(cards: [playerModel.players[3].playerCards[0],playerModel.players[3].playerCards[1],playerModel.players[3].playerCards[2]])
                                    }
                                }
                                ZStack(alignment:.leading){
                                    Rectangle().foregroundColor(.black).opacity(0.7).frame(width: 200, height: 30).shadow(radius: 0.5)
                                    let arr:Stack = [playerModel.players[3].playerCards[0],playerModel.players[3].playerCards[1],playerModel.players[3].playerCards[2]]
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

                    
                    // MARK: MIDDLE HAND
                  
                HStack(spacing:0) {
                            VStack{
                                if isValidHandMiddleHand {
                                    Image(systemName: "hand.thumbsup.fill").resizable().frame(width: 18, height: 18)
                                }
                                else{
                                    Image(systemName: "hand.thumbsdown.fill").resizable().frame(width: 18, height: 18)
                                }
                            }
                            ZStack (alignment:.bottomLeading) {
                                HStack (spacing:0) {
                                    let middleHand = "\(model.middleHandValue)"
                                    Text(middleHand)
                                    ForEach(0 ..< playerModel.players[3].playerCards.count, id: \.self){
                                        index in
                                        if (index >= 3 && index < 8 ){
                                            
                                            Image(playerModel.players[3].playerCards[index].image)
                                                .resizable()
                                                .aspectRatio(contentMode: .fit).frame(width: 60)
                                                .onDrag {
                                                    model.currentCard = playerModel.players[3].playerCards[index]
                                                    return NSItemProvider(contentsOf: URL(string: "\(playerModel.players[3].playerCards[index].id)")!)!
                                                }
                                                .onDrop(of: [.url], delegate: DropViewDelegate(card: playerModel.players[3].playerCards[index],models: model,playerModel: playerModel))
                                        }
                                    }
                                    .onChange(of: playerModel.players[3].playerCards) { newValue in
                                        model.evaluateMiddleHand(cards: [playerModel.players[3].playerCards[3],playerModel.players[3].playerCards[4],playerModel.players[3].playerCards[5],playerModel.players[3].playerCards[6],playerModel.players[3].playerCards[7]])
                                    }
                                    .onAppear{
                                        model.evaluateMiddleHand(cards: [playerModel.players[3].playerCards[3],playerModel.players[3].playerCards[4],playerModel.players[3].playerCards[5],playerModel.players[3].playerCards[6],playerModel.players[3].playerCards[7]])
                                    }
                                    
                                }
                                ZStack(alignment:.leading){
                                    Rectangle().foregroundColor(.black).opacity(0.7).frame(width: 200, height: 30).shadow(radius: 0.5)
                                    let arr:[Card] = [playerModel.players[3].playerCards[3],playerModel.players[3].playerCards[4],playerModel.players[3].playerCards[5],playerModel.players[3].playerCards[6],playerModel.players[3].playerCards[7]]
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

                    // MARK: BACK HAND
                  
                HStack(spacing:0) {
                            VStack{
                                if isValidHandBackHand {
                                    Image(systemName: "hand.thumbsup.fill").resizable().frame(width: 18, height: 18)
                                }
                                else{
                                    Image(systemName: "hand.thumbsdown.fill").resizable().frame(width: 18, height: 18)
                                }
                            }
                            ZStack (alignment:.bottomLeading) {
                                HStack(spacing:0) {
                                    let backHand = "\(model.backHandValue)"
                                    Text(backHand)
                                    ForEach(0 ..< playerModel.players[3].playerCards.count, id: \.self){
                                        index in
                                        if (index >= 8 && index < 13 ){
                                            
                                            Image(playerModel.players[3].playerCards[index].image)
                                                .resizable()
                                                .aspectRatio(contentMode: .fit).frame(width: 60)
                                                .onDrag {
                                                    model.currentCard = playerModel.players[3].playerCards[index]
                                                    return NSItemProvider(contentsOf: URL(string: "\(playerModel.players[3].playerCards[index].id)")!)!
                                                }
                                                .onDrop(of: [.url], delegate: DropViewDelegate(card: playerModel.players[3].playerCards[index],models: model,playerModel: playerModel))
                                        }
                                    }
                                    .onChange(of: playerModel.players[3].playerCards) { newValue in
                                        model.evaluateBackHand(cards: [playerModel.players[3].playerCards[8],playerModel.players[3].playerCards[9],playerModel.players[3].playerCards[10],playerModel.players[3].playerCards[11],playerModel.players[3].playerCards[12]])
                                    }
                                    .onAppear{
                                        model.evaluateBackHand(cards: [playerModel.players[3].playerCards[8],playerModel.players[3].playerCards[9],playerModel.players[3].playerCards[10],playerModel.players[3].playerCards[11],playerModel.players[3].playerCards[12]])
                                    }
                                }
                                ZStack(alignment:.leading){
                                    Rectangle().foregroundColor(.black).opacity(0.7).frame(width: 200, height: 30).shadow(radius: 0.5)
                                    let arr:[Card] = [playerModel.players[3].playerCards[8],playerModel.players[3].playerCards[9],playerModel.players[3].playerCards[10],playerModel.players[3].playerCards[11],playerModel.players[3].playerCards[12]]
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
                // Button to close the current full screen over view
                           Button {
                               presentationMode.wrappedValue.dismiss()
                               showFrontHand = true
                               isShowCompare = true
                               isShowArrange = false
                           } label: {
                               Text("Done")
                           }.padding(.top,10)
                }
         
                    .onAppear {
                        model.evaluateFrontHand(cards: [playerModel.players[3].playerCards[0],playerModel.players[3].playerCards[1],playerModel.players[3].playerCards[2]])
                        model.evaluateBackHand(cards: [playerModel.players[3].playerCards[8],playerModel.players[3].playerCards[9],playerModel.players[3].playerCards[10],playerModel.players[3].playerCards[11],playerModel.players[3].playerCards[12]])
                        model.evaluateMiddleHand(cards: [playerModel.players[3].playerCards[3],playerModel.players[3].playerCards[4],playerModel.players[3].playerCards[5],playerModel.players[3].playerCards[6],playerModel.players[3].playerCards[7]])
                        let arr:Stack = [playerModel.players[3].playerCards[0],playerModel.players[3].playerCards[1],playerModel.players[3].playerCards[2]]
                        let arr2:Stack = [playerModel.players[3].playerCards[3],playerModel.players[3].playerCards[4],playerModel.players[3].playerCards[5],playerModel.players[3].playerCards[6],playerModel.players[3].playerCards[7]]
                        let arr3:Stack = [playerModel.players[3].playerCards[8],playerModel.players[3].playerCards[9],playerModel.players[3].playerCards[10],playerModel.players[3].playerCards[11],playerModel.players[3].playerCards[12]]
                        
                        // MARK: Check if front hand = middle hand && type = HIGH CARD
                        if (model.frontHandValue == model.middleHandValue && model.frontHandValue == 1){
                            let sortedByKeyRank2 = arr2.sorted { $0.rank.rawValue > $1.rank.rawValue }
                            let sortedByKeyRank = arr.sorted { $0.rank.rawValue > $1.rank.rawValue }

                            let temp = [sortedByKeyRank[0].rank.rawValue,sortedByKeyRank[1].rank.rawValue,sortedByKeyRank[2].rank.rawValue]

                            let temp2 = [sortedByKeyRank2[0].rank.rawValue,sortedByKeyRank2[1].rank.rawValue,sortedByKeyRank2[2].rank.rawValue]
                            print(temp)
                            print(temp2)
                            
                            var isValid = false
                            for (e1, e2) in zip(temp, temp2) {
                                if (e1 < e2 ) {
                                    isValid = true
                                    break
                                }
                                else if (e1 > e2){
                                    isValid = false
                                    break
                                }
                                else {
                                    continue
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
                        
                        // MARK: Check if front hand = middle hand && type = PAIR
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
                                if (e1 < e2 ) {
                                    isValid = true
                                    break
                                }
                                else if (e1 > e2){
                                    isValid = false
                                    break
                                }
                                else {
                                    continue
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
                                if (e1 < e2 ) {
                                    isValid = true
                                    break
                                }
                                else if (e1 > e2){
                                    isValid = false
                                    break
                                }
                                else {
                                    continue
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
                                if (e1 < e2 ) {
                                    isValid = true
                                    break
                                }
                                else if (e1 > e2){
                                    isValid = false
                                    break
                                }
                                else {
                                    continue
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
                               if (e1 < e2 ) {
                                   isValid = true
                                   break
                               }
                               else if (e1 > e2){
                                   isValid = false
                                   break
                               }
                               else {
                                   continue
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
                    .background(.red)
                    .frame(width: geo.size.width, height: geo.size.height
                    )
                    .onChange(of: playerModel.players[3].playerCards) { newValue in
                        model.evaluateFrontHand(cards: [playerModel.players[3].playerCards[0],playerModel.players[3].playerCards[1],playerModel.players[3].playerCards[2]])
                        model.evaluateBackHand(cards: [playerModel.players[3].playerCards[8],playerModel.players[3].playerCards[9],playerModel.players[3].playerCards[10],playerModel.players[3].playerCards[11],playerModel.players[3].playerCards[12]])
                        model.evaluateMiddleHand(cards: [playerModel.players[3].playerCards[3],playerModel.players[3].playerCards[4],playerModel.players[3].playerCards[5],playerModel.players[3].playerCards[6],playerModel.players[3].playerCards[7]])
                        let arr:Stack = [playerModel.players[3].playerCards[0],playerModel.players[3].playerCards[1],playerModel.players[3].playerCards[2]]
                        let arr2:Stack = [playerModel.players[3].playerCards[3],playerModel.players[3].playerCards[4],playerModel.players[3].playerCards[5],playerModel.players[3].playerCards[6],playerModel.players[3].playerCards[7]]
                        let arr3:Stack = [playerModel.players[3].playerCards[8],playerModel.players[3].playerCards[9],playerModel.players[3].playerCards[10],playerModel.players[3].playerCards[11],playerModel.players[3].playerCards[12]]
                        if (model.frontHandValue == model.middleHandValue && model.frontHandValue == 1){
                            let sortedByKeyRank2 = arr2.sorted { $0.rank.rawValue > $1.rank.rawValue }
                            let sortedByKeyRank = arr.sorted { $0.rank.rawValue > $1.rank.rawValue }

                            let temp = [sortedByKeyRank[0].rank.rawValue,sortedByKeyRank[1].rank.rawValue,sortedByKeyRank[2].rank.rawValue]

                            let temp2 = [sortedByKeyRank2[0].rank.rawValue,sortedByKeyRank2[1].rank.rawValue,sortedByKeyRank2[2].rank.rawValue]
                            print(temp)
                            print(temp2)

                            var isValid = false
                            for (e1, e2) in zip(temp, temp2) {
                                if (e1 < e2 ) {
                                    isValid = true
                                    break
                                }
                                else if (e1 > e2){
                                    isValid = false
                                    break
                                }
                                else {
                                    continue
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
                                if (e1 < e2 ) {
                                    isValid = true
                                    break
                                }
                                else if (e1 > e2){
                                    isValid = false
                                    break
                                }
                                else {
                                    continue
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
                                if (e1 < e2 ) {
                                    isValid = true
                                    break
                                }
                                else if (e1 > e2){
                                    isValid = false
                                    break
                                }
                                else {
                                    continue
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
                                if (e1 < e2 ) {
                                    isValid = true
                                    break
                                }
                                else if (e1 > e2){
                                    isValid = false
                                    break
                                }
                                else {
                                    continue
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
                               if (e1 < e2 ) {
                                   isValid = true
                                   break
                               }
                               else if (e1 > e2){
                                   isValid = false
                                   break
                               }
                               else {
                                   continue
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
                            isValidHandMiddleHand = false
                        }
                        if (model.middleHandValue > model.backHandValue){
                            isValidHandBackHand = false
                            isValidHandMiddleHand = false
                        }
                        if (model.frontHandValue > model.middleHandValue && model.middleHandValue > model.backHandValue){
                            isValidHandFrontHand = false
                            isValidHandBackHand = false
                            isValidHandMiddleHand = false
                        }
                        
                }
                    .background(Color("Background"))
            }

        }
        
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlayView(showFrontHand: false)
//    }
//}
