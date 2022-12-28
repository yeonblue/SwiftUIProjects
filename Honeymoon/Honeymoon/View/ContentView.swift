//
//  ContentView.swift
//  Honeymoon
//
//  Created by yeonBlue on 2022/12/28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CardView(honeymoon: honeymoonDatas.randomElement()!)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
