//: [Previous](@previous)
//: # Understanding Type Casting in Swift
//: This playground demonstrates type casting in Swift using financial examples.

import Foundation

//: ## What is Type Casting?
//: Type casting is a way to check the type of an instance, or to treat that instance as a different superclass or subclass from somewhere else in its own class hierarchy.

//: ## Defining a Class Hierarchy

class FinancialInstrument {
    var name: String
    init(name: String) { self.name = name }
}

class Stock: FinancialInstrument {
    var ticker: String
    init(name: String, ticker: String) {
        self.ticker = ticker
        super.init(name: name)
    }
}

class Bond: FinancialInstrument {
    var interestRate: Double
    init(name: String, interestRate: Double) {
        self.interestRate = interestRate
        super.init(name: name)
    }
}

// Create instances
let appleStock = Stock(name: "Apple Inc.", ticker: "AAPL")
let treasuryBond = Bond(name: "10-Year Treasury", interestRate: 0.015)
let appleStock2 = appleStock

// Create an array of FinancialInstrument
let instruments: [FinancialInstrument] = [appleStock, treasuryBond]

// Type checking with 'is'
for instrument in instruments {
    if instrument is Stock {
        print("\(instrument.name) is a Stock")
    } else if instrument is Bond {
        print("\(instrument.name) is a Bond")
    }
}

// Downcasting with 'as?'
for instrument in instruments {
    if let stock = instrument as? Stock {
        print("Stock ticker: \(stock.ticker)")
    } else if let bond = instrument as? Bond {
        print("Bond interest rate: \(bond.interestRate * 100)%")
    }
}

// Forced downcasting with 'as!' (use cautiously)
let knownStock = instruments[0] as! Stock
print("Forced downcast - Ticker: \(knownStock.ticker)")

// Type casting with Any
let mixedArray: [Any] = [appleStock, treasuryBond, "Cash", 1000.0]

for item in mixedArray {
    switch item {
    case let stock as Stock:
        print("Stock: \(stock.name) (\(stock.ticker))")
    case let bond as Bond:
        print("Bond: \(bond.name) (\(bond.interestRate * 100)%)")
    case let str as String:
        print("String: \(str)")
    case let num as Double:
        print("Number: \(num)")
    default:
        print("Unknown type")
    }
}

/*
Key Takeaways:
1. Use 'is' for type checking (returns a Bool).
2. Use 'as?' for safe downcasting (returns an optional).
3. Use 'as!' for forced downcasting (use cautiously to avoid runtime errors).
4. Type casting works with class hierarchies and protocols.
5. 'Any' can represent an instance of any type, including function types.
6. Use switch statements with type casting for elegant type checking and downcasting.
*/
//:[Type Casting in Swift](https://rshankar.com/type-casting-in-swift/)

//: [Next](@next)



