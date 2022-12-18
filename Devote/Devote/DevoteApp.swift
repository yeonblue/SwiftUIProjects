//
//  DevoteApp.swift
//  Devote
//
//  Created by yeonBlue on 2022/12/16.
//

import SwiftUI

@main
struct DevoteApp: App {
    
    // MARK: - Properties
    @AppStorage("isDarkMode") var isDarkMode = false
    let persistenceController = PersistenceController.shared

    // MARK: - Body
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
