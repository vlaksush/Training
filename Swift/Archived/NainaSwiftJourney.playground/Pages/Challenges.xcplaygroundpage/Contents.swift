//: [Previous](@previous)

/*:
# Coding Challenges
 
 ## Challenge 1
 
 ### Part 1: Task Class
 Create a `Task` class with the following requirements:
 1. Properties: title (String), isCompleted (Bool)
 2. Initializer that sets the title and defaults isCompleted to false
 3. Method to mark the task as completed
 4. Method to display task information

 ### Part 2: TodoList Class
 Create a `TodoList` class with the following requirements:
 1. Property to store an array of Task objects
 2. Method to add a task
 3. Method to mark a task as completed (by its index in the array)
 4. Method to display all tasks

 ## Challenge 2
 
 Create an extension on Array for numeric types that computes the
 sum of squares of all elements in the array. If the array is
 empty, it should return 0. Name this method sumOfSquares().
 
 ## Challenge 3
 
 ## Part 1: Define the Protocols

 Define a protocol called 'Product' with the following requirements:
 1. A 'name' property of type String
 2. A 'price' property of type Double
 3. A method called 'description' that returns a String

 Define a protocol called 'Discountable' with the following
 requirements:
 
 1. A method called 'applyDiscount' that takes a percentage as a Double and returns a Double

 ## Part 2: Create Conforming Types

 Create a struct called 'Book' that conforms to both 'Product' and 'Discountable'
 1. It should have properties for 'name', 'price', and 'author' (String)
 2. Implement the required methods

 Create a struct called 'Electronics' that conforms to 'Product' only
 1. It should have properties for 'name', 'price', and 'brand' (String)
 2. Implement the required method

 ## Part 3: Create and Use Protocol Types

 Create an array called 'store' that can hold any type conforming to 'Product'. Add at least two Books and two Electronics to this array

 Write a function called 'printProductDetails' that takes a Product as a parameter and prints its name, price, and description

 Create a function called 'applyStoreWideDiscount' that takes an array of Products and a discount percentage, and returns an array of discounted prices.
  Hint: Use optional downcasting (as? Discountable) to check if a product is discountable
 
  ## Part 4: Test Your Code

  Call 'printProductDetails' for each item in the store
  Call 'applyStoreWideDiscount' with your store array and print the results

[Previous](@previous)
*/

class Task {
    let title: String
    var isCompleted: Bool
    
    init(title: String) {
        self.title = title
        self.isCompleted = false
    }
    
    func markAsCompleted() {
        isCompleted = true
    }
    
    func displayInfo() {
        print("Task: \(title), Completed: \(isCompleted ? "Yes" : "No")")
    }
}

class TodoList {
    var tasks: [Task] = []
    
    func addTask(title: String) {
        let newTask = Task(title: title)
        tasks.append(newTask)
    }
    
    func markTaskCompleted(at index: Int) {
        guard index >= 0 && index < tasks.count else {
            print("Invalid task index")
            return
        }
        tasks[index].markAsCompleted()
    }
    
    func displayAllTasks() {
        if tasks.isEmpty {
            print("No tasks in the list.")
        } else {
            for (index, task) in tasks.enumerated() {
                print("\(index + 1). ", terminator: "")
                task.displayInfo()
            }
        }
    }
}

// Create a todo list
let myTodoList = TodoList()

// Add some tasks
myTodoList.addTask(title: "Buy groceries")
myTodoList.addTask(title: "Finish homework")
myTodoList.addTask(title: "Go for a run")

// Display all tasks
print("All tasks:")
myTodoList.displayAllTasks()

// Mark a task as completed
myTodoList.markTaskCompleted(at: 1)

// Display all tasks again
print("\nAfter completing a task:")
myTodoList.displayAllTasks()

// Challenge 2

extension Array where Element: Numeric {
    func sumOfSquares() -> Element {
        return self.reduce(0) { $0 + $1 * $1 }
    }
}

// Example usage:
let intArray = [1, 2, 3, 4, 5]
print(intArray.sumOfSquares())

let doubleArray = [1.5, 2.5, 3.5]
print(doubleArray.sumOfSquares())

let emptyArray: [Int] = []
print(emptyArray.sumOfSquares())

let stringArray = ["Name1","Name2"]

//: ## Part 1: Define the Protocols

protocol Product {
    var name: String { get }
    var price: Double { get }
    func description() -> String
}

protocol Discountable {
    func applyDiscount(_ percentage: Double) -> Double
}

struct Book: Product, Discountable {
    let name: String
    let price: Double
    let author: String
    
    func description() -> String {
        return "\(name) by \(author)"
    }
    
    func applyDiscount(_ percentage: Double) -> Double {
        return price * (1 - percentage / 100)
    }
}

struct Electronics: Product {
    let name: String
    let price: Double
    let brand: String
    
    func description() -> String {
        return "\(brand) \(name)"
    }
}

import Foundation

let book1 = Book(name: "Swift Programming", price: 49.99, author: "John Doe")
let book2 = Book(name: "iOS Development", price: 59.99, author: "Jane Smith")
let electronics1 = Electronics(name: "Headphones", price: 199.99, brand: "AudioMax")
let electronics2 = Electronics(name: "Smartphone", price: 699.99, brand: "TechGiant")

var store: [Product] = [book1, book2, electronics1, electronics2]

func printProductDetails(_ product: Product) {
    print("Name: \(product.name)")
    print("Price: $\(String(format: "%.2f", product.price))")
    print("Description: \(product.description())")
    print("------------------------")
}

func applyStoreWideDiscount(_ products: [Product], discountPercentage: Double) -> [Double] {
    return products.map { product in
        if let discountable = product as? Discountable {
            return discountable.applyDiscount(discountPercentage)
        } else {
            return product.price
        }
    }
}


print("Product Details:")
for product in store {
    printProductDetails(product)
}

let discountedPrices = applyStoreWideDiscount(store, discountPercentage: 10)
print("Discounted prices: \(discountedPrices)")
