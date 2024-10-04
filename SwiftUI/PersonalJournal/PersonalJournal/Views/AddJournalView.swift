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
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    TextField("Title", text: $journalTitle)
                    TextEditor(text: $content)
                        .frame(height: 200)
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
}

//#Preview {
//    AddJournalView()
//}
