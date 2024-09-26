//: [Previous](@previous)

//: # Understanding Extensions in Swift
//: This playground demonstrates the basics of extensions in Swift.

import Foundation

//: ## What are Extensions?
//: Extensions add new functionality to existing types (classes, structures, enumerations, or protocols).
//: They allow you to extend types you don't have access to modify, including Swift's built-in types.

//: ## Extending Built-in Types

extension Double {
    /// Formats the double as a currency string
    func asCurrency() -> String {
        return String(format: "$%.2f", self)
    }
}

let price = 19.99
print("Price: \(price.asCurrency())") // Outputs: Price: $19.99

//: ## Extending Custom Types

struct BankAccount {
    var balance: Double
    let accountNumber: String
}

extension BankAccount {
    /// Deposits money into the account
    mutating func deposit(_ amount: Double) {
        balance += amount
    }
    
    /// Withdraws money from the account if sufficient funds are available
    mutating func withdraw(_ amount: Double) -> Bool {
        guard balance >= amount else { return false }
        balance -= amount
        return true
    }
    
    /// Formats the account details as a string
    func description() -> String {
        return "Account \(accountNumber): Balance \(balance.asCurrency())"
    }
}

var myAccount = BankAccount(balance: 1000, accountNumber: "12345")
myAccount.deposit(500)
print(myAccount.description())

let withdrawalSuccess = myAccount.withdraw(200)
print("Withdrawal successful: \(withdrawalSuccess)")
print(myAccount.description())

//: ## Adding Initializers with Extensions

extension BankAccount {
    /// Creates a new account with an initial deposit
    init(initialDeposit: Double, accountNumber: String) {
        self.balance = initialDeposit
        self.accountNumber = accountNumber
    }
}

let newAccount = BankAccount(initialDeposit: 100, accountNumber: "67890")
print(newAccount.description())

//: ## Extending Protocols

protocol Describable {
    func describe() -> String
}

extension Describable {
    func describe() -> String {
        return "This is a describable item."
    }
}

// Make BankAccount conform to Describable
extension BankAccount: Describable {
    func describe() -> String {
        return "This is a bank account with number \(accountNumber)."
    }
}

print(myAccount.describe())

/*:
 ## Key Takeaways:
 1. Extensions add new functionality to existing types.
 2. You can extend built-in Swift types, your own custom types, and even protocols.
 3. Extensions can add methods, initializers, and computed properties.
 4. They allow you to organize code by separating different functionalities.
 5. Extensions can make types conform to protocols.
 
 Extensions are a powerful feature in Swift for enhancing types without modifying their original implementation.
*/

//:[Closures, Extension and Protocols in Swift](https://rshankar.com/closures-extensions-and-generics-in-swift/)

//: [Next](@next)
