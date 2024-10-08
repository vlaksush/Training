//
//  PersonalJournalUITests.swift
//  PersonalJournalUITests
//
//  Created by Ravi Shankar on 08/10/24.
//

import XCTest

final class PersonalJournalUITests: XCTestCase {
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    func testJournalEntry() throws {
        let app = XCUIApplication()
        app.launch()
        
        // Tap the add button
        app.navigationBars["Personal Journal"].buttons["Add"].tap()
        
        // Fill in the journal entry details
        let titleTextField = app.textFields["Title"]
        titleTextField.tap()
        titleTextField.typeText("UI Test Entry")
        
        let contentTextView = app.textViews.element
        contentTextView.tap()
        contentTextView.typeText("This is a test entry created by UI testing")
        
        // Add a tag
        let tagTextField = app.textFields["Add tags (comma-separated)"]
        tagTextField.tap()
        tagTextField.typeText("uitest")
        app.keyboards.buttons["Return"].tap()
        app.buttons["Save"].tap()
        
        //        let saveButtonPredicate = NSPredicate(format: "label CONTAINS[c] 'save' OR title CONTAINS[c] 'save'")
        //        let saveButton = app.buttons.element(matching: saveButtonPredicate)
        //        XCTAssertTrue(saveButton.exists, "Could not find Save button")
        //        saveButton.tap()
        
        //        let saveButton = app.buttons["Save"]
        //        let exists = saveButton.waitForExistence(timeout: 5)
        //        if exists {
        //            saveButton.tap()
        //        } else {
        //            XCTFail("Save button did not appear")
        //        }
        
        // Verify the new entry appears in the list
        XCTAssertTrue(app.staticTexts["UI Test Entry"].exists)
    }
    
    // Step 3
    func testNavigateToSettings() throws {
        let app = XCUIApplication()
        app.launch()
        
        // Navigate to Settings
        app.tabBars["Tab Bar"].buttons["Settings"].tap()
        
        // Verify Settings view is displayed
        XCTAssertTrue(app.navigationBars["Settings"].exists)
  
        XCUIApplication().tabBars["Tab Bar"].buttons["Settings"].tap()
                
        // Toggle Dark Mode
     //   let darkModeSwitch = app.switches["Dark Mode"]
        
        XCTAssertTrue(app.switches["Dark Mode"].isEnabled)
        XCTAssertTrue(app.switches["Dark Mode"].value as? String == "1")
      //  XCTAssertTrue(darkModeSwitch.exists, "Could not find dark mode switch")
       // darkModeSwitch.tap()
        
        // Verify the switch state changed
        // XCTAssertNotEqual(darkModeSwitch.value as? Int, 0)
    }
    
    
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
}


