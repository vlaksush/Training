//
//  PersonalJournalApp.swift
//  PersonalJournal
//
//  Created by Ravi Shankar on 03/10/24.
//

import SwiftUI

@main
struct PersonalJournalApp: App {
    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView(journalViewModel: JournalViewModel(viewContext: persistenceController.container.viewContext),settingsViewModel: SettingsViewModel())
        }
    }
}
