//
//  Note.swift
//  MemoFinder
//
//  Created by Ravi Shankar on 04/10/24.
//

import SwiftUI

protocol NoteStorageProtocol {
    func saveNote(_ note: Note) throws
    func loadNotes() throws -> [Note]
    func deleteNote(_ note: Note) throws
    func updateNote(_ note: Note) throws
}

struct Note: Identifiable, Codable {
    let id: UUID
    var title: String
    var content: String
    let createdAt: Date
}

class NoteViewModel: ObservableObject {
    @Published var notes: [Note] = []
    @Published var sortOrder: SortOrder = .dateCreated
    
    private let storage: NoteStorageProtocol
    
    init(storage: NoteStorageProtocol? = nil) {
          if let providedStorage = storage {
              self.storage = providedStorage
          } else {
            self.storage = InMemoryNoteStorage()
          }
          loadNotes()
      }
      
    
    enum SortOrder: String, CaseIterable {
        case dateCreated = "Date Created"
        case title = "Title"
    }
    
    var sortedNotes: [Note] {
        switch sortOrder {
        case .dateCreated:
            return notes.sorted { $0.createdAt > $1.createdAt }
        case .title:
            return notes.sorted { $0.title.lowercased() < $1.title.lowercased() }
        }
    }
    
    func addNote(_ note: Note) {
        do {
            try storage.saveNote(note)
            loadNotes()
        } catch {
            print("Error Saving note:\(error)")
        }
    }
    
    func updateNote(_ note: Note) {
        do {
            try storage.updateNote(note)
            loadNotes()
        } catch {
            print("Error updating note: \(error)")
        }
    }
    
    func deleteNote(_ note: Note) {
        do {
            try storage.deleteNote(note)
            loadNotes()
        } catch {
            print("Error deleting note: \(error)")
        }
    }
    
    private func loadNotes() {
        do {
            notes = try storage.loadNotes()
        } catch {
            print("Error loading notes: \(error)")
        }
    }
}


