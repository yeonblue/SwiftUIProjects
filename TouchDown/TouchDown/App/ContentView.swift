//
//  ContentView.swift
//  TouchDown
//
//  Created by yeonBlue on 2022/12/14.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    
    // MARK: - Body
    var body: some View {
        FooterView()
            .padding(.horizontal)
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
