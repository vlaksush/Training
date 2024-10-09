//
//  ContentView.swift
//  SampleProject
//
//  Created by Ravi Shankar on 08/10/24.
//

import SwiftUI
import RSPulse

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            AnimateButton(text: "Refresh") {
                print("from Sample project")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
