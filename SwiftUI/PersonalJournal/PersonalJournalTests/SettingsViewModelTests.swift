//
//  SettingsViewModelTests.swift
//  PersonalJournalTests
//
//  Created by Ravi Shankar on 08/10/24.
//

import XCTest
@testable import PersonalJournal

final class SettingsViewModelTests: XCTestCase {
    
    var settingsViewModel: SettingsViewModel!
    
    override func setUpWithError() throws {
        settingsViewModel = SettingsViewModel()
    }
    
    override func tearDownWithError() throws {
        settingsViewModel = nil
    }
    
    func testToggleDarkMode() {
        // Given
        let initialState = settingsViewModel.isDarkModeEnabled
        
        // When
        settingsViewModel.isDarkModeEnabled.toggle()
        
        // Then
        XCTAssertEqual(settingsViewModel.isDarkModeEnabled, !initialState)
        XCTAssertEqual(UserDefaults.standard.bool(forKey: "isDarkModeEnabled"), !initialState)
    }
    
    func testChangeReminderTime() {
        // Given
        let newTime = Date().addingTimeInterval(3600) // 1 hour from now
        
        // When
        settingsViewModel.reminderTime = newTime
        
        // Then
        XCTAssertEqual(settingsViewModel.reminderTime, newTime)
        XCTAssertEqual(UserDefaults.standard.object(forKey: "reminderTime") as? Date, newTime)
    }
}

