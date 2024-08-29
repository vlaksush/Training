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

// Using guard for early returns
func validateTransaction(amount: Double?) -> Bool {
    guard let transactionAmount = amount, transactionAmount > 0 else {
        print("Invalid transaction amount")
        return false
    }
    // Proceed with valid amount
    return true
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
*/

//: ## 8. Conclusion
/*:
Proper use of optionals in Swift helps create safer, more robust applications. By handling potential absence of values gracefully, we can prevent crashes and provide a better user experience.
*/
