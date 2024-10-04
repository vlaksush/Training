//
//  InMemoryStorage.swift
//  MemoFinder
//
//  Created by Ravi Shankar on 04/10/24.
//

import Foundation

class InMemoryNoteStorage: NoteStorageProtocol {
    private var notes: [Note] = []
    
    func saveNote(_ note: Note) throws {
        if let index = notes.firstIndex(where: { $0.id == note.id }) {
            notes[index] = note
        } else {
            notes.append(note)
        }
    }
    
    func loadNotes() throws -> [Note] {
        return notes
    }
    
    func deleteNote(_ note: Note) throws {
        notes.removeAll { $0.id == note.id }
    }
    
    func updateNote(_ note: Note) throws {
        if let index = notes.firstIndex(where: { $0.id == note.id }) {
            notes[index] = note
        } else {
            throw NSError(domain: "NoteStorage", code: 1, userInfo: [NSLocalizedDescriptionKey: "Note not found"])
        }
    }
}
