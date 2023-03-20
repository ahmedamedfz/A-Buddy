//
//  A_BuddyApp.swift
//  A-Buddy
//
//  Created by Ahmad Fariz on 20/03/23.
//

import SwiftUI

@main
struct A_BuddyApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
