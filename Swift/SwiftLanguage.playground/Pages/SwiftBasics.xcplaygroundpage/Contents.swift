//: [Previous](@previous)

//: Swift Basics

import Foundation

//: Constants and Variables

// 'var' is for values that can change
var accountBalance = 1000.50
accountBalance = 950.75

// 'let' is for values that stay the same (constants)
let paypalFee = 0.029 // 2.9% transaction fee


// Swift can infer types, but you can also be explicit
var userName = "Ramesh Kumar"
var transactionAmount: Double = 99.99

// String interpolation
let merchantName = "Mercy Electronics"
let paymentConfirmation = "Payment of $\(transactionAmount) to \(merchantName) successful."

//: Primitive Data Types

// String - for text
let accountId: String = "PAYPAL-ACC-123456"

// Int - for whole numbers
let loyaltyPoints: Int = 500

// Double - for decimal numbers (64-bit)
let exchangeRate: Double = 1.18 // USD to EUR

// Float - for decimal numbers (32-bit)
let interestRate: Float = 0.05

// Bool - for true/false values
let isPremiumAccount: Bool = true

//: Conditional Statements

let transactionValue = 9000.0

// If-else statement
if transactionValue > 1000 {
    print("Large transaction: Additional verification required")
} else if transactionValue > 100 {
    print("Standard transaction")
} else {
    print("Small transaction")
}

let userTier = "Gold"
let isWeekend = true

if transactionValue > 500 && (userTier == "Gold" || userTier == "Silver") && !isWeekend {
    print("Priority processing for high-value transaction")
} else if transactionValue > 100 || userTier == "Bronze" {
    print("Standard processing")
} else {
    print("Basic processing for small transaction")
}

// Switch statement
switch Int(transactionValue) {
case 0...50:
    print("Micro transaction")
case 51...500:
    print("Standard transaction")
case 501...1000:
    print("Large transaction")
default:
    print("Extra large transaction: Please review")
}

//: Loop Statements

// For-in loop with range
print("Processing batch payments:")
for i in 1...5 {
    print("Processing payment #\(i)")
}

// Underscore for unused variables
for _ in 1...3 {
    print("Attempting connection...")
}

// For-in loop with array
let recentTransactions = ["Payment", "Refund", "Subscription", "Donation"]
for transaction in recentTransactions {
    print("Processing \(transaction)")
}

// While loop
var pendingAuthorizations = 3
while pendingAuthorizations > 0 {
    print("\(pendingAuthorizations) authorizations pending")
    pendingAuthorizations -= 1
}

// Repeat While loop
print("Attempting to process transactions:")
var transactionsProcessed = 0
repeat {
    transactionsProcessed += 1
    print("Processed transaction #\(transactionsProcessed)")
} while transactionsProcessed < recentTransactions.count

// Labeled Statements
let transactionBatches = [
    ["Payment", "Refund"],
    ["Subscription", "Donation", "Refund"],
    ["Payment", "Payment", "Subscription"]
]

outerLoop: for batchIndex in 0..<transactionBatches.count {
    let batch = transactionBatches[batchIndex]
    print("Processing batch #\(batchIndex + 1):")
    
    innerLoop: for transaction in batch {
        if transaction == "Refund" {
            print("Refund detected. Skipping this batch.")
            continue outerLoop
        }
        print("Processing \(transaction)")
    }
    
    print("Batch #\(batchIndex + 1) completed")
}

//: Creating Collections

// Array
var supportedCurrencies: [String] = ["USD", "EUR", "GBP", "JPY", "CAD"]

// Array operations
supportedCurrencies.append("AUD")
supportedCurrencies.insert("CNY", at: 1)
supportedCurrencies.remove(at: 3)

supportedCurrencies.sort { first, second in
    return first > second
}

print(supportedCurrencies)

let preferredCurrency = supportedCurrencies[0]

// Dictionary
var exchangeRates: [String: Double] = ["EUR": 0.84, "GBP": 0.72, "JPY": 110.33, "CAD": 1.25]

// Dictionary operations
exchangeRates["AUD"] = 1.32
exchangeRates["GBP"] = nil // Removes GBP
let eurRate = exchangeRates["EUR"]

// Set
var uniqueTransactionIds: Set<String> = ["TX123", "TX456", "TX789", "TX012"]

// Set operations
uniqueTransactionIds.insert("TX345")
uniqueTransactionIds.remove("TX123")
let isUnique = uniqueTransactionIds.contains("TX789")

// Set specific operations
let domesticTransactions: Set<String> = ["TX123", "TX456", "TX789"]
let internationalTransactions: Set<String> = ["TX789", "TX012", "TX345"]
let allTransactions = domesticTransactions.union(internationalTransactions)
let commonTransactions = domesticTransactions.intersection(internationalTransactions)
let domesticOnlyTransactions = domesticTransactions.subtracting(internationalTransactions)

//: Functions

// Basic function
func calculateTransactionFee(amount: Double) -> Double {
    return amount * paypalFee
}
print("Fee for $100 transaction: $\(calculateTransactionFee(amount: 100))")

// Function with default parameter
func processPayment(amount: Double, currency: String = "USD") -> String {
    return "Processing payment of \(currency) \(amount)"
}
print(processPayment(amount: 50))
print(processPayment(amount: 100, currency: "EUR"))

// Variadic parameters
func totalTransactionAmount(_ amounts: Double...) -> Double {
    var total: Double = 0
    for amount in amounts {
        total += amount
    }
    return total
}
print("Total transaction amount: $\(totalTransactionAmount(23.50, 60.00, 12.75))")

// Inout parameters
func convertCurrency(_ amount: inout Double, from: String, to: String) {
    let fromRate = exchangeRates[from] ?? 1.0
    let toRate = exchangeRates[to] ?? 1.0
    amount = amount / fromRate * toRate
}

var amount = 100.0 // USD
convertCurrency(&amount, from: "USD", to: "EUR")
print("100 USD is approximately \(amount) EUR")

//: ## Tuples
//: Tuples group multiple values into a single compound value

// Basic tuple
let transaction = (type: "deposit", amount: 100.0, currency: "USD")

// Accessing tuple elements
print("Transaction type: \(transaction.type)")
print("Amount: \(transaction.amount)")
print("Currency: \(transaction.currency)")

// Decomposing a tuple
let (txType, txAmount, txCurrency) = transaction
print("Decomposed - Type: \(txType), Amount: \(txAmount), Currency: \(txCurrency)")

// Tuples with switch statements
func describeTransaction(_ transaction: (String, Double, String)) {
    switch transaction {
    case ("deposit", 0...100, "USD"):
        print("Small USD deposit")
    case ("deposit", let amount, "USD") where amount > 100:
        print("Large USD deposit of \(amount)")
    case ("withdrawal", let amount, "USD"):
        print("USD withdrawal of \(amount)")
    case (let type, let amount, let currency):
        print("Other transaction: \(type) of \(amount) \(currency)")
    }
}

// Testing the function with different tuples
describeTransaction(("deposit", 50.0, "USD"))
describeTransaction(("deposit", 200.0, "USD"))
describeTransaction(("withdrawal", 75.0, "USD"))
describeTransaction(("transfer", 100.0, "EUR"))

//: This playground covers the basics of Swift programming including variables, constants, data types, control flow,
//: collections, and functions.

/*:
- [Learn more about Swift Basics](https://rshankar.com/swift-quick-reference/)
- [Tuples](https://rshankar.com/tuples-in-swift/)
*/

//: [Next](@next)
