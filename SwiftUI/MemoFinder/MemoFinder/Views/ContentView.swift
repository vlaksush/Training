//
//  ContentView.swift
//  MemoFinder
//
//  Created by Ravi Shankar on 04/10/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var settingsViewModel = SettingsViewModel()
    @ObservedObject var noteViewModel: NoteViewModel
    @State private var isShowingNewNoteView = false
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Sort Order", selection: $noteViewModel.sortOrder) {
                    ForEach(NoteViewModel.SortOrder.allCases, id: \.self) { order in
                        Text(order.rawValue).tag(order)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                List {
                    ForEach(noteViewModel.sortedNotes) { note in
                        NavigationLink(destination: NoteDetailView(note: note, viewModel: noteViewModel)) {
                            VStack(alignment: .leading) {
                                Text(note.title)
                                    .font(.headline)
                                Text(note.content.prefix(50))
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    .onDelete(perform: deleteNotes)
                }
            }
            .navigationTitle("Memo Minder")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { isShowingNewNoteView = true }) {
                        Image(systemName: "plus")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: SettingsView(viewModel: settingsViewModel)) {
                        Image(systemName: "gear")
                    }
                }
            }
            .sheet(isPresented: $isShowingNewNoteView) {
                NavigationView {
                    NoteDetailView(viewModel: noteViewModel)
                }
            }
        }
        .preferredColorScheme(colorScheme(for: settingsViewModel.colorTheme))
    }
    
    private func deleteNotes(at offsets: IndexSet) {
        offsets.map { noteViewModel.sortedNotes[$0] }.forEach { note in
            noteViewModel.deleteNote(note)
        }
    }
    
    private func colorScheme(for theme: SettingsViewModel.ColorTheme) -> ColorScheme? {
        switch theme {
        case .light:
            return .light
        case .dark:
            return .dark
        case .system:
            return nil
        }
    }
}

#Preview {
    ContentView(noteViewModel: NoteViewModel())
}
