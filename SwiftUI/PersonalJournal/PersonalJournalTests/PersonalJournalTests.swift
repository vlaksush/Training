//
//  PersonalJournalTests.swift
//  PersonalJournalTests
//
//  Created by Ravi Shankar on 08/10/24.
//

import XCTest
import CoreData

@testable import PersonalJournal

final class PersonalJournalTests: XCTestCase {
    
    var persistenceController: PersistenceController!
    var journalViewModel: JournalViewModel!
    
    override func setUpWithError() throws {
        persistenceController = PersistenceController.init(inMemory: true)
        journalViewModel = JournalViewModel(viewContext: persistenceController.container.viewContext)
    }

    override func tearDownWithError() throws {
        persistenceController = nil
        journalViewModel = nil
    }
    
    func testJournalEntry() throws {
        // Given
        let initialCount = journalViewModel.entries.count
        let title = "Test Entry"
        let content = "This is a test entry"
        let tags = ["test", "unit"]
        
        // When
        journalViewModel.addEntry(title: title, content: content, tagNames: tags)
        
        
        // Then
        XCTAssertEqual(journalViewModel.entries.count, initialCount + 1)
        let newEntry = journalViewModel.entries.first
        XCTAssertEqual(newEntry?.title, title)
        XCTAssertEqual(newEntry?.content, content)
        XCTAssertEqual(newEntry?.tags?.count, 2)
    }
    
    
    func testUpdateEntry() throws {
        // Given
        journalViewModel.addEntry(title: "Original", content: "Original content", tagNames: ["original"])
        let entry = journalViewModel.entries.first!
        let newTitle = "Updated"
        let newContent = "Updated content"
        let newTags = ["updated", "test"]
        
        // When
        journalViewModel.updateEntry(entry, title: newTitle, content: newContent, date: Date(), tagNames: newTags)
        
        // Then
        XCTAssertEqual(entry.title, newTitle)
        XCTAssertEqual(entry.content, newContent)
        XCTAssertEqual(entry.tags?.count, 2)
    }
    
    func testDeleteEntry() throws {
        // Given
        journalViewModel.addEntry(title: "To Delete", content: "This will be deleted", tagNames: [])
        let initialCount = journalViewModel.entries.count
        if let entryToDelete = journalViewModel.entries.first {
            
            // When
            journalViewModel.deleteEntry(entryToDelete)
            
            // Then
            XCTAssertEqual(journalViewModel.entries.count, initialCount - 1)
            XCTAssertFalse(journalViewModel.entries.contains(entryToDelete))
        }
    }

//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        // Any test you write for XCTest can be annotated as throws and async.
//        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
//        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
//    }
//
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
