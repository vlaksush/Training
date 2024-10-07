//
//  ContentView.swift
//  PhotoGallery
//
//  Created by Ravi Shankar on 03/10/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct Photo: Identifiable, Codable {
    let id: Int
    let previewURL: String
    let largeImageURL: String
    let user: String
    let tags: String
}

struct PixabayResponse: Codable {
    let total: Int
    let totalHits: Int
    let hits: [Photo]
}

struct PhotoListView: View {
    
    // variables
    @State private var photos = [Photo]()
    @State private var searchText = "famous quotes"
    
    // Sample data
   // let photos = (1...20).map { Photo(name: "photo\($0)") }
    
    let columns = [GridItem(.adaptive(minimum: 100))]

    var body: some View {
        VStack {
            NavigationStack {
                HStack {
                    TextField("Search photos", text: $searchText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button (action: {
                        loadPhotos()
                    }) {
                        Image(systemName: "magnifyingglass")
                    }
                }
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(photos) { photo in
                            NavigationLink(destination: PhotoDetailView(photo: photo)) {
                                WebImage(url:URL(string: photo.previewURL))
                                                                    .resizable()
                                                                    .indicator(.activity)
                                                                    .scaledToFill()
                                                                    .frame(width: 100, height: 100)
                                                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                    }
                }
                .navigationTitle("Photo Gallery")
            }
        }
        .onAppear {
            loadPhotos()
        }
    }
    
    func loadPhotos() {
        PixabayService.shared.searchPhotos(query: searchText) { result in
            switch result {
            case .success(let fetchedPhotos):
                DispatchQueue.main.async {
                    self.photos = fetchedPhotos
                }
            case .failure(let error):
                print(error)
            }
        }
    }

}

#Preview {
    PhotoListView()
}
