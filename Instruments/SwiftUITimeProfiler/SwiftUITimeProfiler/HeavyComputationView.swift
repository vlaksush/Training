//
//  HeavyComputationView.swift
//  SwiftUITimeProfiler
//
//  Created by Ravi Shankar on 09/10/24.
//

import SwiftUI

struct HeavyComputationView: View {
    @State private var result = 0
    
    var body: some View {
        VStack {
            Text("Result: \(result)")
            Button("Perform Heavy Computation") {
                result = performHeavyCalculation()
            }
        }
        .navigationTitle("Heavy Computation")
    }
    
    func performHeavyCalculation() -> Int {
        var result = 0
        for i in 1...100000 {
            result += inefficientFibonacci(i % 30)
        }
        return result
    }
    
    func inefficientFibonacci(_ n: Int) -> Int {
        if n <= 1 {
            return n
        }
        return inefficientFibonacci(n - 1) + inefficientFibonacci(n - 2)
    }
}


#Preview {
    HeavyComputationView()
}

struct OptimizedHeavyComputationView: View {
    @State private var result = 0
    
    var body: some View {
        VStack {
            Text("Result: \(result)")
            Button("Perform Heavy Computation") {
                DispatchQueue.global(qos: .userInitiated).async {
                    let computedResult = performEfficientCalculation()
                    DispatchQueue.main.async {
                        result = computedResult
                    }
                }
            }
        }
        .navigationTitle("Optimized Heavy Computation")
    }
    
    func performEfficientCalculation() -> Int {
        var result = 0
        for i in 1...100000 {
            result += efficientFibonacci(i % 30)
        }
        return result
    }
    
    func efficientFibonacci(_ n: Int) -> Int {
        if n <= 1 { return n }
        var a = 0, b = 1
        for _ in 2...n {
            (a, b) = (b, a + b)
        }
        return b
    }
}
