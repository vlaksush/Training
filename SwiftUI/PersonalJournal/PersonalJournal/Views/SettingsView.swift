//
//  SettingsView.swift
//  PersonalJournal
//
//  Created by Ravi Shankar on 04/10/24.
//

import SwiftUI

struct SettingsView: View {
    @StateObject var viewModel: SettingsViewModel
    
    var appVersion: String {
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            return "v\(version)"
        }
        return "Version Unknown"
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Appearance")) {
                    Toggle("Dark Mode", isOn: $viewModel.isDarkModeEnabled)
                        .accessibilityLabel("Dark Mode")
                }
                
                Section(header: Text("Notifications")) {
                    Toggle("Enable Daily Reminder", isOn: $viewModel.isReminderEnabled)
                    if viewModel.isReminderEnabled {
                        DatePicker("Reminder Time", selection: $viewModel.reminderTime, displayedComponents: .hourAndMinute)
                    }
                }
                
                Section(header: Text("About")) {
                    HStack {
                        Text("App Version")
                        Spacer()
                        Text(appVersion)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView(viewModel: SettingsViewModel())
}

