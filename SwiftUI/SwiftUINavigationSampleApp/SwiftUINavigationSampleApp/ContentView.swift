//
//  ContentView.swift
//  SwiftUINavigationSampleApp
//
//  Created by Ravi Shankar on 13/11/24.
//

import SwiftUI

// MARK: - Custom Colors
extension Color {
    // Define custom colors for the app
    static let customPrimary = Color.red       // Main app color
    static let customSecondary = Color.green    // Secondary color
    static let customBackground = Color.gray.opacity(0.1) // Background color
}

// MARK: - Main Content View
struct ContentView: View {
    // State variables for different navigation types
    @State private var showModalSheet = false
    @State private var showFullScreenCover = false
    @State private var navigationPath = NavigationPath()
    
    var body: some View {
        // NavigationStack for handling navigation
        NavigationStack(path: $navigationPath) {
            // Main content
            ScrollView {
                VStack(spacing: 20) {
                    // Welcome message
                    Text("SwiftUI Navigation Demo")
                        .font(.title)
                        .foregroundColor(.customPrimary)
                        .padding()
                    
                    // MARK: - Navigation Examples
                    Group {
                        // 1. Basic Navigation Link
                        NavigationLink(destination: DetailView(title: "Push Navigation")) {
                            NavigationButtonView(
                                title: "1. Push Navigation",
                                subtitle: "Using NavigationLink",
                                systemImage: "arrow.right",
                                color: .customPrimary
                            )
                        }
                        
                        // 2. Modal Sheet
                        Button {
                            showModalSheet = true
                        } label: {
                            NavigationButtonView(
                                title: "2. Modal Sheet",
                                subtitle: "Slides up from bottom",
                                systemImage: "arrow.up.circle",
                                color: .customSecondary
                            )
                        }
                        .sheet(isPresented: $showModalSheet) {
                            DetailView(title: "Modal Sheet")
                        }
                        
                        // 3. Full Screen Cover
                        Button {
                            showFullScreenCover = true
                        } label: {
                            NavigationButtonView(
                                title: "3. Full Screen",
                                subtitle: "Covers entire screen",
                                systemImage: "rectangle.fill",
                                color: .purple
                            )
                        }
                        .fullScreenCover(isPresented: $showFullScreenCover) {
                            DetailView(title: "Full Screen View")
                        }
                        
                        // 4. Programmatic Navigation
                        Button {
                            // Push multiple screens programmatically
                            navigationPath.append("Screen 1")
                        } label: {
                            NavigationButtonView(
                                title: "4. Programmatic",
                                subtitle: "Code-based navigation",
                                systemImage: "terminal",
                                color: .orange
                            )
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .navigationDestination(for: String.self) { screen in
                DetailView(title: screen)
            }
            // Customize Navigation Bar appearance
            .navigationBarTitleDisplayMode(.large)
            .toolbarBackground(Color.customPrimary, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
    }
}

// MARK: - Custom Button View
struct NavigationButtonView: View {
    let title: String
    let subtitle: String
    let systemImage: String
    let color: Color
    
    var body: some View {
        HStack {
            Image(systemName: systemImage)
                .font(.title2)
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(color)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.customBackground)
        .cornerRadius(10)
    }
}

// MARK: - Detail View
struct DetailView: View {
    // Environment variable to handle dismissal
    @Environment(\.dismiss) private var dismiss
    let title: String
    
    var body: some View {
        VStack(spacing: 20) {
            Text(title)
                .font(.title)
                .foregroundColor(.customPrimary)
            
            Text("This is a detail view that demonstrates different navigation styles in SwiftUI")
                .multilineTextAlignment(.center)
                .padding()
            
            // Show dismiss button for modal presentations
            if title.contains("Modal") || title.contains("Full Screen") {
                Button("Dismiss") {
                    dismiss()
                }
                .buttonStyle(PrimaryButtonStyle())
            }
        }
        .padding()
        .navigationBarTitleDisplayMode(.large)
        // Customize Navigation Bar for detail view
        .toolbarBackground(Color.customPrimary, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarColorScheme(.dark, for: .navigationBar)
    }
}

// MARK: - Custom Button Style
struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.customPrimary)
            .foregroundColor(.white)
            .cornerRadius(10)
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}

// MARK: - Preview

#Preview {
    ContentView()
}
