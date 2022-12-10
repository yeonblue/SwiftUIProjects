//
//  ContentView.swift
//  Fruits
//
//  Created by yeonBlue on 2022/12/08.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    @State private var isShowingSetting = false
    var fruits: [FruitModel] = fruitsData
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            List(fruits) { fruit in
                
                NavigationLink {
                    FruitDetailView(fruit: fruit)
                } label: {
                    FruitRowView(fruit: fruit)
                        .padding(.vertical, 4)
                }
            }
            .navigationTitle("Fruits")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isShowingSetting = true
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                    }
                }
            }
            .sheet(isPresented: $isShowingSetting) {
                SettingsView()
            }
        }
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(fruits: fruitsData)
    }
}
