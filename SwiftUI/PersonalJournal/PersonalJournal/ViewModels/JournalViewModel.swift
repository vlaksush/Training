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
    @Published var tags: [Tag] = []
    
    init(viewContext: NSManagedObjectContext) {
        self.viewContext = viewContext
        fetchEntries()
        fetchTags()
    }
    
    
    func fetchTags() {
        let request: NSFetchRequest<Tag> = Tag.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Tag.name, ascending: true)]
        
        do {
            tags = try viewContext.fetch(request)
        } catch {
            print("Error fetching tags: \(error)")
        }
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
    
    func addEntry(title: String, content: String, tagNames: [String]) {
        let newEntry = JournalEntry(context: viewContext)
        newEntry.title = title
        newEntry.content = content
        newEntry.date = Date()
        
        
        for tagName in tagNames {
            let tag = getOrCreateTag(name: tagName)
            newEntry.addToTags(tag)
        }
    
        saveContext()
    }
    
    func updateEntry(_ entry: JournalEntry, title: String, content: String, date:Date, tagNames:[String]) {
        entry.title = title
        entry.content = content
        entry.date = date
        
        // Remove all existing tags
        if let existingTags = entry.tags as? Set<Tag> {
            entry.removeFromTags(existingTags as NSSet)
        }
        
        for tagName in tagNames {
            let tag = getOrCreateTag(name: tagName)
            entry.addToTags(tag)
        }
    
        saveContext()
    }
    
    private func getOrCreateTag(name: String) -> Tag {
        let request: NSFetchRequest<Tag> = Tag.fetchRequest()
        request.predicate = NSPredicate(format: "name == %@", name)
        
        do {
            let results = try viewContext.fetch(request)
            if let existingTag = results.first {
                return existingTag
            }
        } catch {
            print("Error fetching tag: \(error)")
        }
        
        let newTag = Tag(context: viewContext)
        newTag.name = name
        return newTag
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
