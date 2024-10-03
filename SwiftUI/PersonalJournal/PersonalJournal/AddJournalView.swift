//
//  AddJournalView.swift
//  PersonalJournal
//
//  Created by Ravi Shankar on 03/10/24.
//

import SwiftUI

struct AddJournalView: View {
    @Environment(\.managedObjectContext) private var viewContext
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
                        addEntry()
                        dismiss()
                    }
                }
                ToolbarItem(placement:.bottomBar) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
    
    func addEntry() {
        let entry = JournalEntry(context: viewContext) 
        entry.title = journalTitle
        entry.content = content
        entry.date = Date()
        do {
            try viewContext.save()
        } catch {
            //
        }
    }
}

#Preview {
    AddJournalView()
}
