//
//  PhotoDetailView.swift
//  PhotoExplorer
//
//  Created by Ravi Shankar on 18/09/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct PhotoDetailView: View {
    let photo: Photo
    @State private var scale: CGFloat = 1.0

    var body: some View {
        VStack {
            ZoomableImageView(imageURL: photo.largeImageURL, scale: $scale)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationTitle("Photo Details")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Reset Zoom") {
                    scale = 1.0
                }
            }
        }
    }
}


struct ZoomableImageView: View {
    let imageURL: String
    @Binding var scale: CGFloat

    var body: some View {
        WebImage(url: URL(string: imageURL))
            .resizable()
            .indicator(.activity)
            .transition(.fade(duration: 0.5))
            .scaledToFit()
            .scaleEffect(scale)
            .gesture(
                MagnificationGesture()
                    .onChanged { value in
                        scale = value.magnitude
                    }
            )
            .onTapGesture(count: 2) {
                if scale > 1 {
                    scale = 1
                } else {
                    scale = 2
                }
            }
    }
}
