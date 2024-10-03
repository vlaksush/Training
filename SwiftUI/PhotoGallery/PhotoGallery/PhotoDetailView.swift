//
//  PhotoDetailView.swift
//  PhotoGallery
//
//  Created by Ravi Shankar on 03/10/24.
//

import SwiftUI

struct PhotoDetailView: View {
    
    let photo: Photo
    @State var scale: CGFloat = 1.0
    
    var body: some View {
        VStack {
            ZoomablePhotoView(imageName: photo.name, scale: $scale)
        }
        .navigationBarItems(trailing: Button(action: {
            scale = 1.0
        }, label: {
            Text("Reset")
        }))
    }
}

#Preview {
    PhotoDetailView(photo: Photo(name: "photo4"))
}

struct ZoomablePhotoView: View {
    
    @State var imageName: String
    @Binding var scale: CGFloat
    
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .scaleEffect(scale)
            .gesture(
                MagnificationGesture().onChanged({ change in
                    scale = change
                })
            )
            .onTapGesture(count: 2) {
                if scale > 1.0 {
                    scale = 1.0
                } else {
                    scale = 2.0
                }
            }
    }
}
