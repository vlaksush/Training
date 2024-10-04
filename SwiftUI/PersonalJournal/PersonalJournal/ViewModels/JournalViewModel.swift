//
//  JournalViewModel.swift
//  PersonalJournal
//
//  Created by Ravi Shankar on 04/10/24.
//

import Foundation
import CoreData

class JournalViewModel: ObservableObject {
    private var viewContext: NSManagedObjectContext
    
    @Published var entries: [JournalEntry] = []
    
    init(viewContext: NSManagedObjectContext) {
        self.viewContext = viewContext
        fetchEntries()
    }
    
    func fetchEntries() {
        let request: NSFetchRequest = JournalEntry.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \JournalEntry.date, ascending: false)]
        
        do {
            entries = try viewContext.fetch(request)
        } catch {
            print("Error fetching entries: \(error)")
        }
    }
    
    func addEntry(title: String, content: String) {
        let newEntry = JournalEntry(context: viewContext)
        newEntry.title = title
        newEntry.content = content
        newEntry.date = Date()
        saveContext()
    }
    
    func updateEntry(_ entry: JournalEntry, title: String, content: String, date:Date) {
        entry.title = title
        entry.content = content
        entry.date = date
        saveContext()
    }
    
    func deleteEntry(_ entry: JournalEntry) {
        viewContext.delete(entry)
        saveContext()
    }
    
    private func saveContext() {
        do {
            try viewContext.save()
            fetchEntries()
        } catch {
            print("Error saving context: \(error)")
        }
    }
}
