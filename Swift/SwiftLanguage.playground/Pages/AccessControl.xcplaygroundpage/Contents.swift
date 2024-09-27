//: [Previous](@previous)

//: # Access Control in Swift: Classes vs Structs
//: This playground demonstrates access control in Swift, comparing classes and structs using financial examples.

import Foundation

// Public access example
public class BankAccountClass {
    public let accountNumber: String
    public private(set) var balance: Double
    
    public init(accountNumber: String, initialBalance: Double) {
        self.accountNumber = accountNumber
        self.balance = initialBalance
    }
    
    public func deposit(_ amount: Double) {
        balance += amount
    }
}

public struct BankAccountStruct {
    public let accountNumber: String
    public private(set) var balance: Double
    
    public init(accountNumber: String, initialBalance: Double) {
        self.accountNumber = accountNumber
        self.balance = initialBalance
    }
    
    public mutating func deposit(_ amount: Double) {
        balance += amount
    }
}

// Internal access example (default)
class InvestmentPortfolio {
    var stocks: [String: Int]
    
    init() {
        stocks = [:]
    }
    
    func addStock(symbol: String, shares: Int) {
        stocks[symbol, default: 0] += shares
    }
}

// Private access example
class CreditCard {
    private let cardNumber: String
    private let cvv: String
    public private(set) var limit: Double
    
    init(cardNumber: String, cvv: String, limit: Double) {
        self.cardNumber = cardNumber
        self.cvv = cvv
        self.limit = limit
    }
    
    func displayLastFourDigits() -> String {
        String(cardNumber.suffix(4))
    }
}

// Open access (class-only) example
open class FinancialInstrument {
    open var value: Double
    
    public init(value: Double) {
        self.value = value
    }
    
    open func calculateReturn() -> Double {
        return 0.0 // Default implementation
    }
}

// Usage examples
let classAccount = BankAccountClass(accountNumber: "C12345", initialBalance: 1000)
var structAccount = BankAccountStruct(accountNumber: "S12345", initialBalance: 1000)

classAccount.deposit(500)
structAccount.deposit(500)

print("Class account balance: $\(classAccount.balance)")
print("Struct account balance: $\(structAccount.balance)")

let portfolio = InvestmentPortfolio()
portfolio.addStock(symbol: "AAPL", shares: 10)
print("Portfolio: \(portfolio.stocks)")

let creditCard = CreditCard(cardNumber: "1234567890123456", cvv: "123", limit: 5000)
print("Credit card last four digits: \(creditCard.displayLastFourDigits())")
// print(creditCard.cardNumber) // This would cause a compilation error

/*:
Key Takeaways:
1. Swift has five access levels: open, public, internal, fileprivate, and private.
2. 'public' allows access from any source file in the same module or importing module.
3. 'internal' (default) allows access within the same module.
4. 'private' restricts access to within the same declaration.
5. 'open' is only for classes, allowing subclassing and overriding in other modules.
6. Use 'public private(set)' for properties readable publicly but only settable within the type.
7. Struct methods that modify properties must be marked as 'mutating'.
8. Public structs require explicitly public initializers.

When to use each access level:

- open:
  - Use for classes and class members that you want to be subclassable or overridable outside of your module.
  - Typically used in frameworks where you want to allow users to extend your classes.

- public:
  - Use for interfaces that you want to be accessible to other modules.
  - Ideal for APIs that you want others to use but not necessarily subclass or override.

- internal (default):
  - Use for code that should only be used within your app or framework.
  - Suitable for most code that doesn't need to be exposed to the outside world.

- fileprivate:
  - Use when you want to restrict access to the current file.
  - Useful for functionality that's shared between multiple types in the same file.

- private:
  - Use for information that should be hidden from other parts of your code.
  - Ideal for implementation details that shouldn't be accessed directly from outside the type.

General guideline: Use the most restrictive access level possible for your needs. This helps encapsulate your code and reduces potential for errors from misuse.
*/

//:[Access Control Demo in Swift](https://rshankar.com/access-control-in-swift/)

//: [Next](@next)





