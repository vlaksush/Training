//
//  ContentView.swift
//  PersonalBusinessCard
//
//  Created by Ravi Shankar on 17/09/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image("profile")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 180, height: 180)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.black, lineWidth: 2))
            
            Text("Leonardo DiCaprio")
                .font(.title)
                .fontWeight(.bold)
            
            Text("iOS Developer")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            VStack(alignment: .leading, spacing: 10) {
                HStack(spacing: 15) {
                    Image(systemName: "envelope.fill")
                    Text("leonardo.diCaprio@email.com")
                }
                HStack(spacing: 15) {
                    Image(systemName: "phone.fill")
                    Text("+1 (555) 123-4567")
                }
            }
            .font(.body)
            
            HStack(spacing: 30) {
                Button(action: {
                    // Email action
                }) {
                    Image(systemName: "envelope.fill")
                        .foregroundColor(.white)
                        .frame(width: 50, height: 50)
                        .background(Color.blue)
                        .clipShape(Circle())
                }
                
                Button(action: {
                    // Phone action
                }) {
                    Image(systemName: "phone.fill")
                        .foregroundColor(.white)
                        .frame(width: 50, height: 50)
                        .background(Color.green)
                        .clipShape(Circle())
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}

#Preview {
    ContentView()
        .preferredColorScheme(.light)
}
