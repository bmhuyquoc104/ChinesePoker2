//
//  ContentView.swift
//  ChinesePoker2
//
//  Created by Võ Quốc Huy on 22/08/2022.
//

import SwiftUI

struct PlayView: View {
    var body: some View {
        VStack{
            Text("Hello, world!")
                .padding()
            Text("Hello, world!")
                .padding()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView().previewLayout(.fixed(width: 844, height: 390))
    }
}
