//: This playground demonstrates a banking system using classes in Swift.
//: It showcases inheritance, polymorphism, reference semantics, and various Swift features.

import Foundation

//: ## BankAccount Class
//: A basic bank account class representing a customer's account.

class BankAccount {
    let accountNumber: String
    var balance: Double
    let owner: String
    
    //: ### Lazy Variable Example
    //: `formattedAccountNumber` is only computed when first accessed
    lazy var formattedAccountNumber: String = {
        return "ACCT-" + self.accountNumber
    }()
    
    //: ### Computed Property Example
    //: `balanceDescription` provides a formatted string representation of the balance
    var balanceDescription: String {
        return String(format: "%.2f", balance)
    }
    
    //: ### Designated Initializer
    init(accountNumber: String, initialBalance: Double, owner: String) {
        self.accountNumber = accountNumber
        self.balance = initialBalance
        self.owner = owner
    }
    
    //: ### Convenience Initializer
    //: Provides an alternative way to initialize the object with default values
    convenience init(accountNumber: String, owner: String) {
        self.init(accountNumber: accountNumber, initialBalance: 0, owner: owner)
    }
    
    func deposit(_ amount: Double) {
        balance += amount
        print("Deposited \(amount). New balance: \(balanceDescription)")
    }
    
    func withdraw(_ amount: Double) {
        if balance >= amount {
            balance -= amount
            print("Withdrawn \(amount). New balance: \(balanceDescription)")
        } else {
            print("Insufficient funds")
        }
    }
}

//: ## SavingsAccount Class
//: A savings account that extends the basic bank account with interest calculation.

class SavingsAccount: BankAccount {
    var interestRate: Double
    
    //: ### Computed Property Example
    //: Calculates the projected annual interest based on the current balance
    var projectedAnnualInterest: Double {
        return balance * interestRate
    }
    
    init(accountNumber: String, initialBalance: Double, owner: String, interestRate: Double) {
        self.interestRate = interestRate
        super.init(accountNumber: accountNumber, initialBalance: initialBalance, owner: owner)
    }
    
    func applyInterest() {
        let interest = balance * interestRate
        deposit(interest)
        print("Applied interest: \(interest)")
    }
}

//: ## Bank Class
//: A simple bank class that manages multiple accounts.

class Bank {
    var accounts: [BankAccount] = []
    
    func addAccount(_ account: BankAccount) {
        accounts.append(account)
    }
    
    func findAccount(number: String) -> BankAccount? {
        return accounts.first { $0.accountNumber == number }
    }
}

//: ## Usage Example
//: Let's create some accounts and perform operations to demonstrate the features.

// Create a bank instance
let bank = Bank()

// Using designated initializer
let johnsAccount = BankAccount(accountNumber: "12345", initialBalance: 1000, owner: "John Doe")
bank.addAccount(johnsAccount)

// Using convenience initializer
let emptyAccount = BankAccount(accountNumber: "11111", owner: "Empty Account")
bank.addAccount(emptyAccount)

// Create a savings account
let janeSavings = SavingsAccount(accountNumber: "67890", initialBalance: 5000, owner: "Jane Smith", interestRate: 0.05)
bank.addAccount(janeSavings)

// Demonstrating lazy variable
//print("John's formatted account number: \(johnsAccount.formattedAccountNumber)")

// Using computed properties
print("Jane's current balance: \(janeSavings.balanceDescription)")
print("Jane's projected annual interest: \(janeSavings.projectedAnnualInterest)")

// Perform some operations
johnsAccount.deposit(500)
johnsAccount.withdraw(200)

janeSavings.deposit(1000)
janeSavings.applyInterest()

// Demonstrate reference semantics
let anotherReference = johnsAccount
anotherReference.deposit(300)
print("John's account balance: \(johnsAccount.balanceDescription)") // Will reflect the deposit made through anotherReference

// Find and use an account
if let foundAccount = bank.findAccount(number: "67890") {
    foundAccount.withdraw(500)
    
    // Demonstrate polymorphism
    if let savingsAccount = foundAccount as? SavingsAccount {
        savingsAccount.applyInterest()
    }
}

print("Total accounts in bank: \(bank.accounts.count)")

/*:
 ## Key Points to Remember:
 1. **Inheritance**: `SavingsAccount` inherits from `BankAccount`, allowing for specialized behavior.
 2. **Polymorphism**: The `Bank` class can work with both `BankAccount` and `SavingsAccount` instances.
 3. **Reference Semantics**: Changes to an account are reflected in all references to that account.
 4. **Identity**: Each account maintains its unique identity, crucial for tracking distinct objects.
 5. **Lazy Variables**: `formattedAccountNumber` is only computed when first accessed.
 6. **Computed Properties**: `balanceDescription` and `projectedAnnualInterest` are calculated on-demand.
 7. **Convenience Initializers**: Provide alternative ways to initialize objects.
 8. **Designated Initializers**: The primary initializer for a class that initializes all properties introduced by that class.

 Classes are useful when you need inheritance, shared mutable state, or distinct object identity.

 */

//:[Class and Struct in Swift](https://rshankar.com/difference-between-struct-and-class-in-swift/)
//:[Class Inheritance vs Structs and Protocols](https://rshankar.com/class-inheritance-vs-structs-and-protocols-in-swift/)

//: [Next](@next)
