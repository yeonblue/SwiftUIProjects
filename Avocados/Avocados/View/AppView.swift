//
//  AppView.swift
//  Avocados
//
//  Created by yeonBlue on 2022/12/22.
//

import SwiftUI

struct AppView: View {
    
    // MARK: - Properties
    
    // MARK: - Body
    var body: some View {
        TabView {
            AvocadosView()
                .tabItem {
                    Image("tabicon-branch")
                    Text("Avocados")
                }
            
            ContentView()
                .tabItem {
                    Image("tabicon-book")
                    Text("Receipes")
                }
            
            RipeningStagesView()
                .tabItem {
                    Image("tabicon-avocado")
                    Text("Ripening")
                }
            
            SettingsView()
                .tabItem {
                    Image("tabicon-settings")
                    Text("Settings")
                }
        }
        .tint(.primary)
    }
}

// MARK: - Previews
struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
