//
//  ContentView.swift
//  PersonalJournal
//
//  Created by Ravi Shankar on 04/10/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var journalViewModel: JournalViewModel
    @ObservedObject var settingsViewModel: SettingsViewModel = SettingsViewModel()
    
    var body: some View {
        TabView {
                   JournalListView(viewModel: journalViewModel)
                       .tabItem {
                           Label("Journal", systemImage: "book.fill")
                       }
                   SettingsView(viewModel: settingsViewModel)
                       .tabItem {
                           Label("Settings", systemImage: "gear")
                       }
               }
        .preferredColorScheme(settingsViewModel.isDarkModeEnabled ? .dark : .light)
        .accentColor(.blue)
    }
}

#Preview {
    ContentView(journalViewModel: JournalViewModel(viewContext: PersistenceController.preview.container.viewContext), settingsViewModel: SettingsViewModel())
}


