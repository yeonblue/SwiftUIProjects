//
//  ContentView.swift
//  Avocados
//
//  Created by yeonBlue on 2022/12/21.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    var headers: [Header] = headersData
    
    // MARK: - Body
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                
                // MARK: - Header
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top) {
                        ForEach(headers) { item in
                            HeaderView(header: item)
                        }
                    }
                }
                
                // MARK: - Footer
                VStack(alignment: .center, spacing: 20) {
                    Text("All About Avocados")
                        .font(.system(.title, design: .serif))
                        .fontWeight(.bold)
                        .foregroundColor(Color("ColorGreenAdaptive"))
                        .padding()
                    
                    Text("Everything you wanted to know avout avocados but were too afraid to ask.")
                        .font(.system(.body, design: .serif))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                    
                }
                .frame(maxWidth: 640)
                .padding(.horizontal)
                .padding(.bottom, 80)
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
