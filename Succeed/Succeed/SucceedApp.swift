//
//  SucceedApp.swift
//  Succeed
//
//  Created by Daniel Senga on 2021/06/16.
//

import SwiftUI

@main
struct SucceedApp: App {
    let persistenceController = PersistenceController.shared
    
    @AppStorage("isDarkMode") var isDarkMode: Bool = false

    var body: some Scene {
        WindowGroup{
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
