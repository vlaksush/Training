//
//  ContentView.swift
//  MyFirstAppSwiftUI
//
//  Created by Ravi Shankar on 20/09/24.
//

import SwiftUI

struct ContentView: View {
    @State private var welcomeText = "Hello, World!"

    var body: some View {
        VStack {
            HStack {
                Text(welcomeText)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.blue)
                Image(systemName: "star.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .foregroundColor(.yellow)
            }
            Button("Press Me") {
                welcomeText = "Welcome to SwiftUI!"
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)
            .font(.title)
        }
    }
}

#Preview {
    ContentView()
}
