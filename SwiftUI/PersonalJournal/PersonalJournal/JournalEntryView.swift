//
//  JournalEntryView.swift
//  PersonalJournal
//
//  Created by Ravi Shankar on 03/10/24.
//

import SwiftUI

struct JournalEntryView: View {
    
    let entry: JournalEntry
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(entry.title ?? "")
                .font(.title)
            Text(entry.date ?? Date(), style: .date)
                .font(.subheadline)
                .foregroundColor(.secondary)
            Text(entry.content ?? "")
            Spacer()
        }
        .navigationTitle("Journal Entry")
        .padding()
    }
}

//#Preview {
//    JournalEntryView()
//}
