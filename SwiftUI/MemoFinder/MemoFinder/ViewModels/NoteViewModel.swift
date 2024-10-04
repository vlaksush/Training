//
//  Note.swift
//  MemoFinder
//
//  Created by Ravi Shankar on 04/10/24.
//

import SwiftUI

struct Note: Identifiable {
    let id: UUID
    var title: String
    var content: String
    let createdAt: Date
}

class NoteViewModel: ObservableObject {
    @Published var notes: [Note] = []
    @Published var sortOrder: SortOrder = .dateCreated
    
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
        notes.append(note)
    }
    
    func updateNote(_ note: Note) {
        if let index = notes.firstIndex(where: { $0.id == note.id }) {
            notes[index] = note
        }
    }
    
    func deleteNote(_ note: Note) {
        notes.removeAll { $0.id == note.id }
    }
}

