//: [Previous](@previous)
//: # Understanding ARC and Memory Management in Swift
//: This playground demonstrates the basics of Automatic Reference Counting (ARC) and memory management in Swift using simple financial examples.

import Foundation

//: ## What is ARC?
//: Automatic Reference Counting (ARC) is Swift's memory management system. It automatically keeps track of class instances and deallocates them when they're no longer needed.

//: ## Basic Class Definitions
//: Let's start with simple `BankAccount` and `Customer` classes to demonstrate ARC in action.

class BankAccount {
    let accountNumber: String
    var balance: Double
    var customer: Customer?
    
    init(accountNumber: String, balance: Double) {
        self.accountNumber = accountNumber
        self.balance = balance
        print("BankAccount \(accountNumber) is created")
    }
    
    deinit {
        print("BankAccount \(accountNumber) is destroyed")
    }
}

class Customer {
    let name: String
    var account: BankAccount?
    
    init(name: String) {
        self.name = name
        print("Customer \(name) is created")
    }
    
    deinit {
        print("Customer \(name) is destroyed")
    }
}

//: ## Strong References
//: By default, all references in Swift are strong. A strong reference keeps an instance alive.

print("--- Strong References ---")
var account1: BankAccount? = BankAccount(accountNumber: "12345", balance: 1000)
var account2 = account1
account1 = nil
print("account1 is nil, but account2 still holds a reference")
account2 = nil
print("account2 is nil, BankAccount is now destroyed")

//: ## Reference Cycles and Memory Leaks
//: A reference cycle occurs when two instances hold strong references to each other, preventing ARC from deallocating them.

print("\n--- Reference Cycles ---")
var customer: Customer? = Customer(name: "John")
var account: BankAccount? = BankAccount(accountNumber: "67890", balance: 500)

customer?.account = account
account?.customer = customer  // This creates a reference cycle

customer = nil
account = nil
print("Neither customer nor account is destroyed due to reference cycle")

//: ## Weak References
//: Weak references don't keep an instance alive. They're always optional and automatically become nil when the instance they refer to is deallocated.

print("\n--- Weak References ---")
class WeakCustomer {
    let name: String
    weak var account: BankAccount?
    
    init(name: String) {
        self.name = name
        print("WeakCustomer \(name) is created")
    }
    
    deinit {
        print("WeakCustomer \(name) is destroyed")
    }
}

var weakCustomer: WeakCustomer? = WeakCustomer(name: "Alice")
var weakAccount: BankAccount? = BankAccount(accountNumber: "54321", balance: 1500)

weakCustomer?.account = weakAccount
// No reference cycle because 'account' is weak
weakAccount = nil
print("BankAccount is destroyed, and WeakCustomer's account is nil")
weakCustomer = nil

/*:
 ## Key Takeaways:
 1. ARC automatically manages memory in Swift by keeping track of references to instances.
 2. Strong references keep an instance alive. They're the default in Swift.
 3. Reference cycles can cause memory leaks when two instances hold strong references to each other.
 4. Weak references don't keep an instance alive and are always optional.
 5. Use weak references to break reference cycles and prevent memory leaks.
 
 Understanding ARC and proper memory management is crucial for writing efficient and leak-free Swift code.
*/

//: [Next](@next)

//:[Memory Management in Swift](https://rshankar.com/memory-management-in-swift/)


