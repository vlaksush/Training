//
//  ContentView.swift
//  RetainCycle
//
//  Created by Ravi Shankar on 08/10/24.
//

import SwiftUI

// ContentView.swift
struct ContentView: View {
    @State private var showDetailView = false
    
    var body: some View {
        Button("Show Detail View") {
            showDetailView = true
        }
        .sheet(isPresented: $showDetailView) {
            DetailView()
        }
    }
}

// DetailView.swift
struct DetailView: View {
    @StateObject private var viewModel = DetailViewModel()
    
    var body: some View {
        VStack {
            Text(viewModel.data)
            Button("Update Data") {
                viewModel.updateData()
            }
        }
        .onAppear {
            viewModel.setupUpdateClosure()
        }
    }
}

// DetailViewModel.swift
class DetailViewModel: ObservableObject {
    @Published var data: String = "Initial Data"
    private var updateClosure: (() -> Void)?
    
    init() {
        print("DetailViewModel initialized")
    }
    
    deinit {
        print("DetailViewModel deinitialized")
    }
    
    func setupUpdateClosure() {
        // This creates a retain cycle
        updateClosure = {
            self.data = "Updated Data"
        }
        
//        updateClosure = { [weak self] in
//            self?.data = "Updated Data"
//        }
    }
    
    func updateData() {
        updateClosure?()
    }
}
