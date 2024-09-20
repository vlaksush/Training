//
//  ContentView.swift
//  MyFirstAppSwiftUI
//
//  Created by Ravi Shankar on 20/09/24.
//

import SwiftUI

struct ContentView: View {
    @State private var welcomeText = "Welcome to SwiftUI!"

    var body: some View {
        VStack {
            Text(welcomeText)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.blue)
            Button("Press Me") {
                welcomeText = "Button Pressed!"
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)
            Image(systemName: "star.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .foregroundColor(.yellow)
        }
    }
}

#Preview {
    ContentView()
}
