//
//  ContentView.swift
//  PersonalJournal
//
//  Created by Ravi Shankar on 03/10/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \JournalEntry.date
                                           , ascending: true)],
        animation: .default)
    private var entries: FetchedResults<JournalEntry>
    @State var showAddEntryView: Bool = false
    
    
    var body: some View {
        NavigationView {
            List(entries) { entry in
                NavigationLink(destination:JournalEntryView(entry: entry)) {
                    Text(entry.title ?? "")
                        .font(.headline)
                    Text(entry.date ?? Date(), style: .date)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            .navigationBarItems(trailing:
                                    Button(action: {
                showAddEntryView = true
            }, label: {
                Text("Add")
            }))
        }
        .sheet(isPresented: $showAddEntryView, content: {
            AddJournalView()
        })
    }
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
