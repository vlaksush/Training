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

