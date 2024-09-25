//: [Previous](@previous)

//# Swift Optionals Playground Presentation

import Foundation
import PlaygroundSupport

//: ## 1. Introduction to Optionals

/*:
Optionals in Swift are a powerful feature that allow us to represent the absence of a value. They are crucial for:

- Handling potentially missing data safely
- Preventing crashes due to unexpected nil values
- Clearly expressing API contracts
*/

//: ## 2. Declaring and Unwrapping Optionals

// Declaring optionals
var userBalance: Double?  // Optional Double
var accountNumber: String?  // Optional String

//: ## 3. Optional Binding

// Safe unwrapping with optional binding
func processPayment(amount: Double?) {
    if let paymentAmount = amount {
        // Process the payment
        print("Processing payment of $\(paymentAmount)")
    } else {
        print("Invalid payment amount")
    }
}

//: The `guard` statement allows us to check conditions early and exit the function if they're not met.
//: This improves code readability and reduces nesting.

//: ## Example Usage

// Using guard for early returns
func validateTransaction(amount: Double?) -> Bool {
    guard let transactionAmount = amount, transactionAmount > 0 else {
        print("Invalid transaction amount")
        return false
    }
    // Proceed with valid amount
    return true
}

enum TransferError: Error {
    case invalidAmount
    case insufficientFunds
}

func processTransfer(amount: Double, balance: Double) throws -> Double {
    // Use guard to check if the amount is positive
    guard amount > 0 else {
        throw TransferError.invalidAmount
    }
    
    // Use guard to check if there are sufficient funds
    guard balance >= amount else {
        throw TransferError.insufficientFunds
    }
    
    // If both guards pass, perform the transfer
    return balance - amount
}

let currentBalance = 1000.0

do {
    let newBalance = try processTransfer(amount: 500.0, balance: currentBalance)
    print("Transfer successful. New balance: $\(newBalance)")
} catch TransferError.invalidAmount {
    print("Transfer failed: Invalid amount")
} catch TransferError.insufficientFunds {
    print("Transfer failed: Insufficient funds")
}

// Example User and Account structs
struct User {
    var account: Account?
}

struct Account {
    let id: String
    var balance: Double?
    var preferredCurrency: Currency?
}

struct Currency {
    let code: String
}

// Optional binding of variables in struct
func displayBalance(for user: User) {
    if let balance = user.account?.balance {
        print("Your balance is $\(balance)")
    } else {
        print("Balance information unavailable")
    }
}

let user = User(account: Account(id: "ACC123", balance: 100.0, preferredCurrency: Currency(code: "USD")))
displayBalance(for: user)

//: ## 4. Optional Chaining
let balance = user.account?.balance

func displayUserCurrency(for user: User?) {
    if let currencyCode = user?.account?.preferredCurrency?.code {
        print("User's preferred currency: \(currencyCode)")
    } else {
        print("Currency information not available")
    }
}

displayUserCurrency(for: user)

//: ## 5. Nil-Coalescing Operator
func getDisplayBalance(for user: User?) -> String {
    let balance = user?.account?.balance ?? 0.0
    return "Balance: $\(balance)"
}

print(getDisplayBalance(for: user))


//: ## 7. Best Practices
/*:
- Avoid force unwrapping in production code
- Use optional binding for safety
- Leverage optional chaining for clean, readable code
- Consider using default values with nil-coalescing
- Be cautious with implicitly unwrapped optionals
- `guard` is used for early exits and improving code readability.
- It's great for input validation and safely unwrapping optionals.
*/
//:[Optional Binding and Optional Chaining](https://rshankar.com/optional-bindings-in-swift/)
//:[Choosing between guard statement and if let](https://rshankar.com/optional-bindings-in-swift/)
//: [Next](@next)
