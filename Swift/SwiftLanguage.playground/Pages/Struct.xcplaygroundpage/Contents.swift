//: # Simple Swift Struct Example: Library Book

import Foundation

//: ## Book Struct
//: This struct represents a book in a library system.

struct Book {
    // Properties
    let title: String
    let author: String
    let isbn: String
    var isCheckedOut: Bool
    
    // Initializer
    init(title: String, author: String, isbn: String) {
        self.title = title
        self.author = author
        self.isbn = isbn
        self.isCheckedOut = false
    }

    
    // Method to check out the book
    mutating func checkOut() {
        isCheckedOut = true
    }
    
    // Method to return the book
    mutating func returnBook() {
        isCheckedOut = false
    }
    
    // Method to display book information
    func displayInfo() {
        print("Title: \(title)")
        print("Author: \(author)")
        print("ISBN: \(isbn)")
        print("Status: \(isCheckedOut ? "Checked Out" : "Available")")
    }
}

//: ## Using the Book Struct

// Create a new book
var myBook = Book(title: "The Swift Programming Language", author: "Apple Inc.", isbn: "1234567890")

// Display initial book information
print("Initial book information:")
myBook.displayInfo()

// Check out the book
myBook.checkOut()

// Display updated book information
print("\nAfter checking out:")
myBook.displayInfo()

// Return the book
myBook.returnBook()

// Display final book information
print("\nAfter returning:")
myBook.displayInfo()

//: ## Key Points about Structs:
//: 1. Structs group related properties and methods together.
//: 2. Structs get a memberwise initializer for free, but we can also define custom initializers.
//: 3. Methods that modify properties need the 'mutating' keyword.
//: 4. Structs are value types, meaning they are copied when assigned to a new variable or passed as an argument.

//:[Class and Struct in Swift](https://rshankar.com/difference-between-struct-and-class-in-swift/)
//:[Class Inheritance vs Structs and Protocols](https://rshankar.com/class-inheritance-vs-structs-and-protocols-in-swift/)

//: [Next](@next)
