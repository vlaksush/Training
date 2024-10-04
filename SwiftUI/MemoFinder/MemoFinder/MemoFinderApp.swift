//
//  MemoFinderApp.swift
//  MemoFinder
//
//  Created by Ravi Shankar on 04/10/24.
//

import SwiftUI
import SwiftData

@main
struct MemoFinderApp: App {
    
    enum StorageType {
        case fileSystem
        case swiftData
        case inMemory
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(noteViewModel: createViewModel(storageType: .swiftData))
        }
    }
    
    private func createViewModel(storageType: StorageType) -> NoteViewModel {
        let storage: NoteStorageProtocol
        
        switch storageType {
        case .inMemory:
            storage = InMemoryNoteStorage()
        case .fileSystem:
            do {
                storage = try FileSystemNoteStorage()
            } catch {
                print("Failed to initialize FileSystemNoteStorage, falling back to in-memory storage: \(error)")
                storage = InMemoryNoteStorage()
            }
        case .swiftData:
            do {
                let container = try ModelContainer(for: SwiftDataNote.self)
                storage = SwiftDataNoteStorage(modelContainer: container)
            } catch {
                print("Failed to initialize SwiftDataNoteStorage, falling back to in-memory storage: \(error)")
                storage = InMemoryNoteStorage()
            }
        }
        return NoteViewModel(storage: storage)
    }
}
