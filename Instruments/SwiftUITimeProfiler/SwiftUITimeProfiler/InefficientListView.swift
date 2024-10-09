//
//  InefficientView.swift
//  SwiftUITimeProfiler
//
//  Created by Ravi Shankar on 09/10/24.
//

import SwiftUI

struct InefficientListView: View {
    @State private var numbers = Array(1...10000)
    
    var body: some View {
        List {
            ForEach(numbers, id: \.self) { number in
                HStack {
                    Text("\(number)")
                    Spacer()
                    // Inefficient: Creating a new closure for each row
                    Button("Multiply") {
                        if let index = numbers.firstIndex(of: number) {
                            numbers[index] *= 2
                        }
                    }
                }
            }
        }
        .navigationTitle("Inefficient List")
    }
}

#Preview {
    InefficientListView()
}

struct EfficientListView: View {
       @State private var numbers = Array(1...10000)
       
       var body: some View {
           List {
               ForEach(numbers.indices, id: \.self) { index in
                   HStack {
                       Text("\(numbers[index])")
                       Spacer()
                       Button("Multiply") {
                           multiplyNumber(at: index)
                       }
                   }
               }
           }
           .navigationTitle("Efficient List")
       }
       
       func multiplyNumber(at index: Int) {
           numbers[index] *= 2
       }
   }
