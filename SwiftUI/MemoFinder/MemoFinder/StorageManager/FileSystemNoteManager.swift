//
//  FileSystemNoteManager.swift
//  MemoFinder
//
//  Created by Ravi Shankar on 04/10/24.
//

import Foundation

class FileSystemNoteStorage: NoteStorageProtocol {
    private let fileManager = FileManager.default
    private let notesDirectory: URL
    
    init() throws {
        let documentsDirectory = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        notesDirectory = documentsDirectory.appendingPathComponent("Notes", isDirectory: true)
        try fileManager.createDirectory(at: notesDirectory, withIntermediateDirectories: true, attributes: nil)
    }
    
    func saveNote(_ note: Note) throws {
        let noteURL = notesDirectory.appendingPathComponent("\(note.id.uuidString).json")
        let data = try JSONEncoder().encode(note)
        try data.write(to: noteURL)
    }
    
    func loadNotes() throws -> [Note] {
        let noteURLs = try fileManager.contentsOfDirectory(at: notesDirectory, includingPropertiesForKeys: nil)
        return try noteURLs.compactMap { url in
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode(Note.self, from: data)
        }
    }
    
    func deleteNote(_ note: Note) throws {
        let noteURL = notesDirectory.appendingPathComponent("\(note.id.uuidString).json")
        try fileManager.removeItem(at: noteURL)
    }
    
    func updateNote(_ note: Note) throws {
        try saveNote(note)
    }
}
