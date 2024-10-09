//
//  ExpensiveBindingView.swift
//  SwiftUITimeProfiler
//
//  Created by Ravi Shankar on 09/10/24.
//

import SwiftUI

import SwiftUI

struct ExpensiveBindingView: View {
    @State private var text = ""
    @State private var processedText = ""
    
    var body: some View {
        VStack {
            TextField("Enter text", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            // Inefficient: Performing expensive operation on every character change
            Text("Processed: \(processText(text))")
        }
        .navigationTitle("Expensive Binding")
    }
    
    func processText(_ input: String) -> String {
        // Simulate an expensive operation
        let processed = input.reversed()
        Thread.sleep(forTimeInterval: 0.1) // Artificially slow down the process
        return String(processed)
    }
}


#Preview {
    ExpensiveBindingView()
}

struct OptimizedExpensiveBindingView: View {
      @State private var text = ""
      @State private var processedText = ""
      @State private var workItem: DispatchWorkItem?
      
      var body: some View {
          VStack {
              TextField("Enter text", text: $text)
                  .textFieldStyle(RoundedBorderTextFieldStyle())
                  .padding()
                  .onChange(of: text) { newValue in
                      debouncedProcessText(newValue)
                  }
              
              Text("Processed: \(processedText)")
          }
          .navigationTitle("Optimized Expensive Binding")
      }
      
      func debouncedProcessText(_ input: String) {
          workItem?.cancel()
          
          let newWorkItem = DispatchWorkItem {
              let processed = String(input.reversed())
              DispatchQueue.main.async {
                  self.processedText = processed
              }
          }
          
          workItem = newWorkItem
          DispatchQueue.global().asyncAfter(deadline: .now() + 0.3, execute: newWorkItem)
      }
  }
