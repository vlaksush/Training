//: [Previous](@previous)

//: # Higher-Order Functions in Swift
//: This playground demonstrates the use of common higher-order functions in Swift: map, filter, and reduce.

import Foundation

//: ## What are Higher-Order Functions?
//: Higher-order functions are functions that take other functions as parameters or return functions as output.
//: They allow us to write more concise and expressive code.

//: Let's start with an array of financial transactions to use in our examples:
let transactions = [
    ("Grocery", 50.5),
    ("Gas", 30.0),
    ("Restaurant", 45.75),
    ("Movie", 12.0),
    ("Grocery", 35.25)
]

//: ## Map
//: `map` transforms each element in a collection using a provided closure.

//: Let's use `map` to extract just the amounts from our transactions:
let amounts = transactions.map { $0.1 }
print("All amounts: \(amounts)")

//: We can also use `map` to create more complex transformations:
let formattedTransactions = transactions.map { "\($0.0): $\($0.1)" }
print("\nFormatted transactions:")
formattedTransactions.forEach { print($0) }

//: ## Filter
//: `filter` creates a new collection containing only the elements that satisfy a given condition.

//: Let's use `filter` to get only the transactions over $40:
let expensiveTransactions = transactions.filter { $0.1 > 40 }
print("\nExpensive transactions (over $40):")
expensiveTransactions.forEach { print("\($0.0): $\($0.1)") }

//: We can also combine conditions in our filter:
let groceryOver30 = transactions.filter { $0.0 == "Grocery" && $0.1 > 30 }
print("\nGrocery transactions over $30:")
groceryOver30.forEach { print("\($0.0): $\($0.1)") }

//: ## Reduce
//: `reduce` combines all elements in a collection into a single value.

//: Let's use `reduce` to calculate the total amount spent:
let totalSpent = transactions.reduce(0) { $0 + $1.1 }
print("\nTotal amount spent: $\(totalSpent)")

//: We can use `reduce` for more complex operations, like finding the most expensive transaction:
let mostExpensive = transactions.reduce(("", 0.0)) { $0.1 > $1.1 ? $0 : $1 }
print("Most expensive transaction: \(mostExpensive.0) at $\(mostExpensive.1)")

//: ## Combining Higher-Order Functions
//: We can chain these functions together for more powerful operations.

//: Let's calculate the average amount spent on groceries:
let averageGrocery = transactions
    .filter { $0.0 == "Grocery" }  // First, filter to keep only grocery transactions
    .map { $0.1 }                  // Then, map to keep only the amounts
    .reduce(0, +)                  // Sum up all the amounts
    / Double(transactions.filter { $0.0 == "Grocery" }.count)  // Divide by the count of grocery transactions

print("\nAverage spent on groceries: $\(averageGrocery)")

/*:
 ## Key Takeaways:
 1. `map` transforms each element in a collection.
 2. `filter` creates a new collection with elements that satisfy a condition.
 3. `reduce` combines all elements into a single value.
 4. These functions can be chained together for complex operations.
 5. Higher-order functions often lead to more readable and concise code.
 
 Try modifying the examples or creating your own to get more familiar with these powerful functions!
*/

//:[Higher Order Functions in Swift](https://rshankar.com/higher-order-functions-in-swift/)

//: [Next](@next)

