//
//  SwiftDataNoteStorage.swift
//  MemoFinder
//
//  Created by Ravi Shankar on 04/10/24.
//

import Foundation
import SwiftData

@Model
final class SwiftDataNote: Identifiable {
    let id: UUID
    var title: String
    var content: String
    var createdAt: Date
    
    init(id: UUID = UUID(), title: String, content: String, createdAt: Date = Date()) {
        self.id = id
        self.title = title
        self.content = content
        self.createdAt = createdAt
    }
}

class SwiftDataNoteStorage: NoteStorageProtocol {
    private var modelContext: ModelContext
    
    init(modelContainer: ModelContainer) {
        self.modelContext = ModelContext(modelContainer)
    }
    
    func saveNote(_ note: Note) throws {
        let swiftDataNote = SwiftDataNote(from: note)
        modelContext.insert(swiftDataNote)
        try modelContext.save()
    }
    
    func loadNotes() throws -> [Note] {
        let descriptor = FetchDescriptor<SwiftDataNote>(sortBy: [SortDescriptor(\.createdAt, order: .reverse)])
        let swiftDataNotes = try modelContext.fetch(descriptor)
        return swiftDataNotes.map { $0.toNote() }
    }
    
    func deleteNote(_ note: Note) throws {
        let descriptor = FetchDescriptor<SwiftDataNote>(predicate: #Predicate { $0.id == note.id })
        let swiftDataNotes = try modelContext.fetch(descriptor)
        if let swiftDataNote = swiftDataNotes.first {
            modelContext.delete(swiftDataNote)
            try modelContext.save()
        }
    }
    
    func updateNote(_ note: Note) throws {
        let descriptor = FetchDescriptor<SwiftDataNote>(predicate: #Predicate { $0.id == note.id })
        let swiftDataNotes = try modelContext.fetch(descriptor)
        if let swiftDataNote = swiftDataNotes.first {
            swiftDataNote.title = note.title
            swiftDataNote.content = note.content
            try modelContext.save()
        }
    }
}

extension SwiftDataNote {
    convenience init(from note: Note) {
        self.init(id: note.id, title: note.title, content: note.content, createdAt: note.createdAt)
    }
    
    func toNote() -> Note {
        Note(id: self.id, title: self.title, content: self.content, createdAt: self.createdAt)
    }
}

