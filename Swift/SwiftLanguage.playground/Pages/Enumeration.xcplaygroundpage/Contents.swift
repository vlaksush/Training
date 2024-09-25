//: [Previous](@previous)

//: # Understanding Enumerations in Swift
//: This playground introduces enumerations in Swift, demonstrating their use and benefits with financial examples.

import Foundation

//: ## What are Enumerations?
//: Enumerations define a common type for a group of related values and enable you to work with those values in a type-safe way within your code.

//: ## Basic Enumeration

//: Let's start with a simple enumeration for different types of bank accounts:

enum AccountType {
    case checking
    case savings
    case moneyMarket
}

let myAccount = AccountType.checking
print("My account type is: \(myAccount)")

//: ## Switch Statement with Enumerations

//: Enumerations work great with switch statements:

func describeAccount(_ account: AccountType) {
    switch account {
    case .checking:
        print("A checking account for everyday transactions.")
    case .savings:
        print("A savings account to accumulate interest on deposits.")
    case .moneyMarket:
        print("A money market account for higher interest rates.")
    }
}

describeAccount(.savings)

//: ## Enumerations with Associated Values

//: Enumerations can have associated values, allowing you to attach additional information to each case:

enum BankTransaction {
    case deposit(Double)
    case withdrawal(Double)
    case transfer(from: String, to: String, amount: Double)
}

let transactions: [BankTransaction] = [
    .deposit(100.0),
    .withdrawal(50.0),
    .transfer(from: "Checking", to: "Savings", amount: 200.0)
]

for transaction in transactions {
    switch transaction {
    case .deposit(let amount):
        print("Deposited $\(amount)")
    case .withdrawal(let amount):
        print("Withdrew $\(amount)")
    case .transfer(let from, let to, let amount):
        print("Transferred $\(amount) from \(from) to \(to)")
    }
}

//: ## Enumerations with Raw Values

//: You can assign raw values to enumeration cases:

enum CurrencyCode: String {
    case usd = "USD"
    case eur = "EUR"
    case gbp = "GBP"
    case jpy = "JPY"
}

let currency = CurrencyCode.eur
print("Currency code: \(currency.rawValue)")

//: You can also create an enumeration instance from a raw value:

if let retrievedCurrency = CurrencyCode(rawValue: "GBP") {
    print("Retrieved currency: \(retrievedCurrency)")
} else {
    print("Invalid currency code")
}

//: ## Enumerations with Methods and Properties

//: Enumerations can have methods and computed properties:

enum PaymentMethod {
    case cash
    case credit
    case debit
    case cryptoCurrency(coinType: String)
    
    var fees: Double {
        switch self {
        case .cash:
            return 0.0
        case .credit:
            return 0.03
        case .debit:
            return 0.01
        case .cryptoCurrency:
            return 0.05
        }
    }
    
    func describe() -> String {
        switch self {
        case .cash:
            return "Cash payment"
        case .credit:
            return "Credit card payment"
        case .debit:
            return "Debit card payment"
        case .cryptoCurrency(let coinType):
            return "\(coinType) cryptocurrency payment"
        }
    }
}

let payment = PaymentMethod.cryptoCurrency(coinType: "Bitcoin")
print(payment.describe())
print("Fees for this payment method: \(payment.fees * 100)%")


/*:
 ## Key Takeaways:
 1. Enumerations group related values and allow you to work with them in a type-safe way.
 2. They work great with switch statements for exhaustive handling of cases.
 3. Enumerations can have associated values, allowing you to attach additional information to each case.
 4. You can assign raw values to enumeration cases for easy conversion to and from other types.
 5. Enumerations can have methods and computed properties.
 
 Enumerations in Swift are much more powerful than in many other languages, making them a versatile tool for modeling a wide variety of data and states in your applications.
*/
//:[Learn more about Swift Enums](https://rshankar.com/enum-in-swift/)
//:[Tuples, Enums and Protocols in Swift](https://rshankar.com/protocol-in-swift/)

//: [Next](@next)
