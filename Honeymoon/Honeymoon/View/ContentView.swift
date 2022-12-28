//
//  ContentView.swift
//  Honeymoon
//
//  Created by yeonBlue on 2022/12/28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            HeaderView()
            
            Spacer()
            
            CardView(honeymoon: honeymoonDatas.randomElement()!)
                .padding()
    
            Spacer()
            
            FooterView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
