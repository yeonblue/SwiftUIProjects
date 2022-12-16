//
//  DevoteApp.swift
//  Devote
//
//  Created by yeonBlue on 2022/12/16.
//

import SwiftUI

@main
struct DevoteApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
