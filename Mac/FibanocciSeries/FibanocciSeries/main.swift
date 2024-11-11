//
//  main.swift
//  FibanocciSeries
//
//  Created by Ravi Shankar on 08/11/24.
//

import Foundation

// Function to get valid input from user
func getValidNumber() -> Int {
    while true {
        print("Enter how many Fibonacci numbers you want to generate (minimum 2): ", terminator: "")
        if let input = readLine(),
           let number = Int(input) {
            if number >= 2 {
                return number
            } else {
                print("Please enter a number greater than or equal to 2")
            }
        } else {
            print("Please enter a valid number")
        }
    }
}

// Function to generate Fibonacci series
func generateFibonacci(_ n: Int) -> [Int] {
    var fibSeries = [0, 1]
    
    // Generate subsequent numbers
    for _ in 2..<n {
        let nextNum = fibSeries[fibSeries.count - 1] + fibSeries[fibSeries.count - 2]
        fibSeries.append(nextNum)
    }
    
    return fibSeries
}

// Main program loop
func main() {
    print("\nWelcome to the Fibonacci Series Generator!")
    print("----------------------------------------")
    
    var continueGenerating = true
    
    while continueGenerating {
        // Get input from user
        let count = getValidNumber()
        
        // Generate and display the series
        let fibSeries = generateFibonacci(count)
        
        print("\nFibonacci Series:")
        for (index, number) in fibSeries.enumerated() {
            print("\(index + 1). \(number)")
        }
        
        // Ask if user wants to continue
        print("\nWould you like to generate another series? (y/n): ", terminator: "")
        if let response = readLine()?.lowercased() {
            continueGenerating = response == "y"
        }
    }
    
    print("\nThank you for using the Fibonacci Series Generator!")
}

// Start the program
main()

