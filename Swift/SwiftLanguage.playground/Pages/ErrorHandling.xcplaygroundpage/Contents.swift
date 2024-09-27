//: [Previous](@previous)

//: # Understanding Error Handling in Swift
//: This playground demonstrates error handling in Swift using financial examples.

import Foundation

// Define custom errors
enum BankError: Error {
    case insufficientFunds(needed: Double, available: Double)
    case invalidAmount
}

// Create a simple BankAccount struct
struct BankAccount {
    var balance: Double
    
    mutating func withdraw(_ amount: Double) throws {
        guard amount > 0 else {
            throw BankError.invalidAmount
        }
        
        guard balance >= amount else {
            throw BankError.insufficientFunds(needed: amount, available: balance)
        }
        
        balance -= amount
    }
}

// Create an account and demonstrate error handling
var account = BankAccount(balance: 100)

// Example 1: Successful withdrawal
do {
    try account.withdraw(50)
    print("Successfully withdrew 50. New balance: \(account.balance)")
} catch {
    print("Withdrawal failed: \(error)")
}

// Example 2: Insufficient funds
do {
    try account.withdraw(100)
} catch BankError.insufficientFunds(let needed, let available) {
    print("Error: Insufficient funds. Needed \(needed), but only \(available) available.")
} catch {
    print("An unexpected error occurred: \(error)")
}

// Example 3: Invalid amount
do {
    try account.withdraw(-10)
} catch BankError.invalidAmount {
    print("Error: Cannot withdraw a negative amount.")
}

// Example 4: Using optional try
if let _ = try? account.withdraw(25) {
    print("Successfully withdrew 25. New balance: \(account.balance)")
} else {
    print("Failed to withdraw 25.")
}

// Example 5: Force try (use with caution!)
// try! account.withdraw(10)  // This would crash if an error is thrown

/*
Key Takeaways:
1. Define custom errors using enums that conform to the Error protocol.
2. Use 'throws' to mark functions that can throw errors.
3. Use 'throw' to raise an error in a function.
4. Handle errors using do-catch blocks.
5. You can catch specific error types for more detailed handling.
6. Use 'try?' to convert an error to an optional.
7. Use 'try!' when you're certain no error will be thrown (use cautiously).
*/

//:[Error Handling in Swift](https://rshankar.com/error-handling-in-swift/)

//: [Next](@next)
