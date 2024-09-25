//: [Previous](@previous)

//: # Understanding Closures in Swift
//: This playground introduces closures in Swift.

import Foundation

//: ## What are Closures?
//: Closures are self-contained blocks of functionality that can be passed around and used in your code.
//: They're similar to functions, but more flexible and concise.

/*: 
 ````
   { (parameters) -> ReturnType in
     // closure body
   }
 ````
*/

//: ## Basic Closure Syntax

//: Here's a simple function that takes two string and returns a welcome message

func createWelcomeMessage(name: String, message: String) -> String {
    return "\(message) \(name)!!"
}

createWelcomeMessage(name: "Ravi", message: "Wlecome")

//: The same functionality as a closure

var welcomeMessage = { (name:String, message:String) -> (String) in
    " \(message) \(name)!!"
}

welcomeMessage("Ravi","Welcome")

//: ## Type Inference and Shorthand Syntax
//: Swift's type inference allows us to simplify our closure syntax

// Full syntax
let multiply: (Int, Int) -> Int = { (a: Int, b: Int) -> Int in
    return a * b
}

// With type inference
//let multiply: (Int, Int) -> Int = { a, b in
//    return a * b
//}

// With implicit return
// let multiply: (Int, Int) -> Int = { a, b in a * b }

// With shorthand argument names
// let multiply: (Int, Int) -> Int = { $0 * $1 }

print(multiply(4, 5)) // Prints: 20

func performOperation(_ a: Int, _ b: Int, operation: (Int, Int) -> Int) -> Int {
    return operation(a,b)
}

let result = performOperation(4, 5, operation: { $0 + $1 })
print(result) // Prints: 20

//: ## Trailing Closure Syntax
//: When a closure is the last parameter of a function, you can use trailing closure syntax:

let performResult = performOperation(4, 5) { $0 * $1 }
print(performResult) // Prints: 20

//: ## Capturing Values

//: Closures can capture and store references to variables and constants from the surrounding context:

func makeIncrementer(incrementAmount: Int) -> () -> Int {
    var total = 0
    let incrementer: () -> Int = {
        total += incrementAmount
        return total
    }
    return incrementer
}

let incrementByTen = makeIncrementer(incrementAmount: 10)
print(incrementByTen()) // Prints: 10
print(incrementByTen()) // Prints: 20

//: ## Real World Example: Network Request

// Define the function for making an API call
func makeApiCall(urlString: String, completion: @escaping (Result<[String: Any], Error>) -> Void) {
    // Ensure the URL is valid
    guard let url = URL(string: urlString) else {
        // If the URL is invalid, call the completion handler with an error
        completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
        return
    }
    
    // Create a network task
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        // Handle errors if there are any
        if let error = error {
            completion(.failure(error))  // Pass the error to the completion handler
            return
        }
        
        // Ensure we received data
        guard let data = data else {
            completion(.failure(NSError(domain: "No data received", code: 0, userInfo: nil)))
            return
        }
        
        do {
            // Try to parse the data as JSON
            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                completion(.success(json))  // Pass the parsed JSON to the completion handler
            } else {
                completion(.failure(NSError(domain: "Invalid JSON format", code: 0, userInfo: nil)))
            }
        } catch {
            completion(.failure(error))  // Handle JSON parsing errors
        }
    }
    
    // Start the network request
    task.resume()  // The task runs asynchronously
}

// Usage example
let apiUrl = "http://ip-api.com/json/"
makeApiCall(urlString: apiUrl) { result in
    switch result {
    case .success(let json):
        print("API Response:")
        for (key, value) in json {
            print("\(key): \(value)")
        }
    case .failure(let error):
        print("Error: \(error.localizedDescription)")
    }
}

print("API call initiated. Waiting for response...")

/*:
 ## Key Takeaways:
 1. Closures are self-contained blocks of functionality, similar to functions.
 2. They can be passed as arguments to functions or stored in variables.
 3. Closure syntax can be shortened in several ways for more concise code.

*/

//:[Clsoures in Swift](https://rshankar.com/understanding-closures-in-swift/)

//: [Next](@next)


