//
//  JournalEntryView.swift
//  PersonalJournal
//
//  Created by Ravi Shankar on 03/10/24.
//

import SwiftUI

struct JournalEntryView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject var viewModel: JournalViewModel
    @StateObject var entry: JournalEntry
    
    @State private var title: String
    @State private var content: String
    @State private var date: Date
    @State private var tagInput: String = ""
    @State private var selectedTags: [String] = []
    
    init(entry: JournalEntry, viewModel: JournalViewModel) {
        self.title = entry.title ?? ""
        self.content = entry.content ?? ""
        self.date = entry.date ?? Date()
        _entry = StateObject(wrappedValue: entry)
        _viewModel = StateObject(wrappedValue: viewModel)
        // _selectedTags = State(initialValue: (entry.tags as? Set<Tag>)?.compactMap { $0.name } ?? [])
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Form {
                Section(header: Text("Title")) {
                    TextField("Enter title", text: $title)
                }
                
                Section(header: Text("Date")) {
                    DatePicker("Entry Date", selection: $date, displayedComponents: .date)
                }
                
                Section(header: Text("Content")) {
                    TextEditor(text: $content)
                        .frame(minHeight: 200)
                }
                Section(header: Text("Tags")) {
                    TextField("Add tags (comma-separated)", text: $tagInput)
                    
                    ForEach(selectedTags, id: \.self) { tag in
                        Text(tag)
                    }
                    .onDelete(perform: deleteTags)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        viewModel.updateEntry(entry, title: title, content: content, date: date)
                        dismiss()
                    }
                }
            }
            .navigationTitle("Journal Entry")
            .padding()
        }
    }
    
    private func addTags() {
        let newTags = tagInput.split(separator: ",").map { $0.trimmingCharacters(in: .whitespaces) }
        selectedTags.append(contentsOf: newTags)
        tagInput = ""
    }
    
    private func deleteTags(at offsets: IndexSet) {
        selectedTags.remove(atOffsets: offsets)
    }
}

#Preview {
    JournalEntryView(entry: PersistenceController.previewEntry, viewModel: JournalViewModel(viewContext: PersistenceController.preview.container.viewContext))
}
