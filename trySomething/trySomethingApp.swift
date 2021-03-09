//
//  trySomethingApp.swift
//  trySomething
//
//  Created by User22 on 2021/3/3.
//

import SwiftUI

@main
struct trySomethingApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
