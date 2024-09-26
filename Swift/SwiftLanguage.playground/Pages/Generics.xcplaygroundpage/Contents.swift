//: # Understanding Generics in Swift
//: This playground introduces the basics of generics in Swift with simple examples.

import Foundation

//: ## What are Generics?
//: Generics allow you to write flexible, reusable functions and types that can work with any type.

//: ## Generic Functions

//: Here's a simple generic function that can work with any type:

/// Swaps two values of any type
func swapValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var firstNumber = 10
var secondNumber = 20

print("Before swap: firstNumber = \(firstNumber), secondNumber = \(secondNumber)")
swapValues(&firstNumber, &secondNumber)
print("After swap: firstNumber = \(firstNumber), secondNumber = \(secondNumber)")

var firstString = "Hello"
var secondString = "World"

print("\nBefore swap: firstString = \(firstString), secondString = \(secondString)")
swapValues(&firstString, &secondString)
print("After swap: firstString = \(firstString), secondString = \(secondString)")

//: ## Generic Types

//: Now let's create a simple generic type:

/// A box that can hold any type of value
struct Box<T> {
    var content: T
    
    func peek() -> T {
        return content
    }
}

let intBox = Box(content: 42)
print("\nValue in intBox: \(intBox.peek())")

let stringBox = Box(content: "Generics are cool!")
print("Value in stringBox: \(stringBox.peek())")

//: ## Type Constraints

//: We can constrain the types that can be used with our generic code:

/// Finds the largest value in an array of comparable items
func findLargest<T: Comparable>(_ items: [T]) -> T? {
    return items.max()
}

let numbers = [5, 2, 8, 1, 9]
if let largestNumber = findLargest(numbers) {
    print("\nLargest number: \(largestNumber)")
}

let words = ["swift", "generics", "programming"]
if let largestWord = findLargest(words) {
    print("Alphabetically last word: \(largestWord)")
}

/*:
 ## Key Takeaways:
 1. Generics allow you to write flexible, reusable code that can work with any type.
 2. You can create generic functions and types using angle brackets: <T>.
 3. Type constraints (like <T: Comparable>) allow you to restrict which types can be used with your generic code.
 4. Generics help you write code that is both abstract and type-safe.
 
 Generics are a powerful feature in Swift that enable you to write more flexible and reusable code while maintaining type safety.
*/

//:[Closures, Extension and Protocols in Swift](https://rshankar.com/closures-extensions-and-generics-in-swift/)

//: [Next](@next)
