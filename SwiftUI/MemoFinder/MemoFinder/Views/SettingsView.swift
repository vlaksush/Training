//
//  SettingsView.swift
//  MemoFinder
//
//  Created by Ravi Shankar on 04/10/24.
//


import SwiftUI


struct SettingsView: View {
    @ObservedObject var viewModel: SettingsViewModel
    
    var body: some View {
        Form {
            Section(header: Text("Appearance")) {
                Picker("Color Theme", selection: $viewModel.colorTheme) {
                    ForEach(SettingsViewModel.ColorTheme.allCases, id: \.self) { theme in
                        Text(theme.rawValue).tag(theme)
                    }
                }
            }
            
            Section(header: Text("About")) {
                Text("MemoMinder v1.0")
                    .foregroundColor(.secondary)
            }
        }
        .navigationTitle("Settings")
        .onDisappear {
            viewModel.saveSettings()
        }
    }
}
