//
//  AddJournalView.swift
//  PersonalJournal
//
//  Created by Ravi Shankar on 03/10/24.
//

import SwiftUI

struct AddJournalView: View {
    @StateObject var viewModel: JournalViewModel
    @Environment(\.dismiss) private var dismiss
    
    @State private var journalTitle: String = ""
    @State private var content: String = ""
    @State private var tagInput: String = ""
    @State private var selectedTags: [String] = []
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Journal Entry")) {
                        TextField("Title", text: $journalTitle)
                        TextEditor(text: $content)
                            .frame(height: 200)
                    }
                    Section(header: Text("Tags")) {
                        TextField("Add tags (comma-separated)", text: $tagInput)
                        
                        ForEach(selectedTags, id: \.self) { tag in
                            Text(tag)
                        }
                        .onDelete(perform: deleteTags)
                    }
                }
            }
            .toolbar{
                ToolbarItem(placement:.bottomBar) {
                    Button("Save") {
                        viewModel.addEntry(title: journalTitle, content: content)
                        dismiss()
                    }
                }
                ToolbarItem(placement:.bottomBar) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
            .navigationTitle("Add Journal")
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
    AddJournalView(viewModel: JournalViewModel(viewContext: PersistenceController.preview.container.viewContext))
}
