//
//  SettingsViewModel.swift
//  MemoFinder
//
//  Created by Ravi Shankar on 04/10/24.
//

import Foundation

struct Settings: Codable {
    var colorTheme: SettingsViewModel.ColorTheme
}

class SettingsViewModel: ObservableObject {
    @Published var colorTheme: ColorTheme
    
    enum ColorTheme: String, CaseIterable, Codable {
        case system = "System"
        case light = "Light"
        case dark = "Dark"
    }
    
    private let settingsURL: URL
    
    init() {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        self.settingsURL = documentsDirectory.appendingPathComponent("settings.plist")
        
        // Initialize colorTheme with a default value
        self.colorTheme = .system
        
        // Now that all stored properties are initialized, we can call loadSettings
        if let savedSettings = loadSettings() {
            self.colorTheme = savedSettings.colorTheme
        }
    }
    
    private func loadSettings() -> Settings? {
        guard let data = try? Data(contentsOf: settingsURL) else {
            return nil
        }
        
        return try? PropertyListDecoder().decode(Settings.self, from: data)
    }
    
    func saveSettings() {
        let settings = Settings(colorTheme: colorTheme)
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        
        do {
            let data = try encoder.encode(settings)
            try data.write(to: settingsURL)
        } catch {
            print("Error saving settings: \(error)")
        }
    }
}
