//
//  NoteDetailView.swift
//  MemoFinder
//
//  Created by Ravi Shankar on 04/10/24.
//

import SwiftUI

struct NoteDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: NoteViewModel
    @State private var title: String
    @State private var content: String
    var note: Note?
    
    init(note: Note? = nil, viewModel: NoteViewModel) {
        self.viewModel = viewModel
        self.note = note
        _title = State(initialValue: note?.title ?? "")
        _content = State(initialValue: note?.content ?? "")
    }
    
    var body: some View {
        Form {
            Section(header: Text("Title")) {
                TextField("Enter title", text: $title)
            }
            
            Section(header: Text("Content")) {
                TextEditor(text: $content)
                    .frame(minHeight: 200)
            }
        }
        .navigationTitle(note == nil ? "New Note" : "Edit Note")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Save") {
                    saveNote()
                }
            }
        }
    }
    
    private func saveNote() {
        let updatedNote = Note(
            id: note?.id ?? UUID(),
            title: title,
            content: content,
            createdAt: note?.createdAt ?? Date()
        )
        if note == nil {
            viewModel.addNote(updatedNote)
        } else {
            viewModel.updateNote(updatedNote)
        }
        presentationMode.wrappedValue.dismiss()
    }
}
