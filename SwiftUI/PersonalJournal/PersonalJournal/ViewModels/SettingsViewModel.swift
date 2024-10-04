//
//  SettingsViewModel.swift
//  PersonalJournal
//
//  Created by Ravi Shankar on 04/10/24.
//

import Foundation

class SettingsViewModel: ObservableObject {
    @Published var isDarkModeEnabled: Bool {
        didSet {
            UserDefaults.standard.set(isDarkModeEnabled, forKey: "isDarkModeEnabled")
        }
    }
    
    @Published var reminderTime: Date {
        didSet {
            UserDefaults.standard.set(reminderTime, forKey: "reminderTime")
            scheduleReminder()
        }
    }
    
    @Published var isReminderEnabled: Bool {
        didSet {
            UserDefaults.standard.set(isReminderEnabled, forKey: "isReminderEnabled")
            if isReminderEnabled {
                scheduleReminder()
            } else {
                NotificationManager.shared.cancelAllNotifications()
            }
        }
    }
    
    init() {
        self.isDarkModeEnabled = UserDefaults.standard.bool(forKey: "isDarkModeEnabled")
        self.reminderTime = UserDefaults.standard.object(forKey: "reminderTime") as? Date ?? Date()
        self.isReminderEnabled = UserDefaults.standard.bool(forKey: "isReminderEnabled")
        
        NotificationManager.shared.requestAuthorization()
    }
    
    private func scheduleReminder() {
        guard isReminderEnabled else { return }
        NotificationManager.shared.scheduleDaily(at: reminderTime, title: "Journal Reminder", body: "It's time to write in your journal!")
    }
}
