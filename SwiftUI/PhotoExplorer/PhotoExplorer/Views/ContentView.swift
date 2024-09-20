//
//  ContentView.swift
//  PhotoExplorer
//
//  Created by Ravi Shankar on 18/09/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    @State private var searchText = "famous quotes"
    @State private var photos: [Photo] = []
    @State private var showingAlert = false
    @State private var alertMessage = ""
    
    let columns = [GridItem(.adaptive(minimum: 100))]
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText, onSearchButtonClicked: fetchPhotos)
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(photos) { photo in
                            NavigationLink(destination: PhotoDetailView(photo: photo)) {
                                PhotoThumbnail(imageURL: photo.previewURL)
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Pixabay Gallery")
        }
        .onAppear(perform: fetchPhotos)
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }
    
    private func fetchPhotos() {
        PixabayService.shared.searchPhotos(query: searchText) { result in
            switch result {
            case .success(let fetchedPhotos):
                DispatchQueue.main.async {
                    self.photos = fetchedPhotos
                }
            case .failure(let error):
                if let pixabayError = error as? PixabayService.PixabayError, pixabayError == .invalidAPIKey {
                    self.alertMessage = "Please update your API key in PixabayService."
                } else {
                    self.alertMessage = "An error occurred: \(error.localizedDescription)"
                }
                self.showingAlert = true
            }
        }
    }
}

struct SearchBar: View {
    @Binding var text: String
    var onSearchButtonClicked: () -> Void
    
    var body: some View {
        HStack {
            TextField("Search photos", text: $text, onCommit: onSearchButtonClicked)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button(action: onSearchButtonClicked) {
                Image(systemName: "magnifyingglass")
            }
        }
        .padding()
    }
}

struct PhotoThumbnail: View {
    let imageURL: String
    
    var body: some View {
        WebImage(url: URL(string: imageURL))
            .resizable()
            .indicator(.activity)
            .transition(.fade(duration: 0.5))
            .scaledToFill()
            .frame(width: 100, height: 100)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    ContentView()
}
