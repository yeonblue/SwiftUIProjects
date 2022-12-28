//
//  ContentView.swift
//  Honeymoon
//
//  Created by yeonBlue on 2022/12/28.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    @State var showAlert = false
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            HeaderView()
            
            Spacer()
            
            CardView(honeymoon: honeymoonDatas.randomElement()!)
                .padding()
    
            Spacer()
            
            FooterView(showBookingAlert: $showAlert)
        }
        .alert("Success", isPresented: $showAlert) {

            Button("Happy Honeymoon!", role: .cancel) { // iOS 15 이상 방식
                
            }
        
        } message: {
            Text("Wishing a lovely and most precious of the times together for the amazing couple.")
        }
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
