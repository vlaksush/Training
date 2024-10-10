//
//  ContentView.swift
//  SwiftUITimeProfiler
//
//  Created by Ravi Shankar on 08/10/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var text: String = ""
    
    var body: some View {
        NavigationView {
            TextField("", text: $text, prompt: Text("Placeholder").foregroundStyle(.blue))
            List {
                NavigationLink("Inefficient List", destination: InefficientListView())
                NavigationLink("Heavy Computation", destination: HeavyComputationView())
                NavigationLink("Expensive Binding", destination: ExpensiveBindingView())
                
//                NavigationLink("Inefficient List", destination: EfficientListView())
//                NavigationLink("Heavy Computation", destination: OptimizedHeavyComputationView())
//                NavigationLink("Expensive Binding", destination: OptimizedExpensiveBindingView())
            }
            .navigationTitle("Performance Demo")
        }
    }
}

#Preview {
    ContentView()
}
