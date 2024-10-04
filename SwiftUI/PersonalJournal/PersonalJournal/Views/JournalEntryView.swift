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
    
    init(entry: JournalEntry, viewModel: JournalViewModel) {
        self.title = entry.title ?? ""
        self.content = entry.content ?? ""
        self.date = entry.date ?? Date()
        _entry = StateObject(wrappedValue: entry)
        _viewModel = StateObject(wrappedValue: viewModel)
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

//#Preview {
//    JournalEntryView(entry: PersistenceController.testEntry)
//}
