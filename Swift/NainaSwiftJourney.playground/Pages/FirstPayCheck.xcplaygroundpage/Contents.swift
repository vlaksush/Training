//: [Previous](@previous)

/*:
# First Paycheck? Let's Spend It All

Naina's First Paycheck Story:

Naina, a newly employed software developer, has just received her first paycheck. Excited about her newfound financial freedom, she decides to treat herself to a shopping spree. Being the organized coder she is, Naina creates a generic shopping system to manage her purchases across different categories.

In this section, we'll see how Naina uses generics to manage her shopping spree efficiently and flexibly.
*/

import Foundation

// MARK: - First Paycheck? Let's Spend It All

// Product protocol
protocol Product {
    var name: String { get }
    var price: Double { get }
}

// Generic ShoppingCart
class ShoppingCart<ItemType: Product> {
    private var items: [ItemType] = []
    
    func addItem(_ item: ItemType) {
        items.append(item)
    }
    
    func getAllItems() -> [ItemType] {
        return items
    }
    
    func getTotalPrice() -> Double {
        return items.reduce(0) { $0 + $1.price }
    }
}

// Concrete product types
struct TechGadget: Product {
    let name: String
    let price: Double
    let specs: String
}

struct ClothingItem: Product {
    let name: String
    let price: Double
    let size: String
}

// Naina's shopping spree
let techCart = ShoppingCart<TechGadget>()
techCart.addItem(TechGadget(name: "Mechanical Keyboard", price: 150, specs: "Cherry MX switches"))
techCart.addItem(TechGadget(name: "Ultrawide Monitor", price: 699, specs: "34-inch, 3440x1440"))

let clothingCart = ShoppingCart<ClothingItem>()
clothingCart.addItem(ClothingItem(name: "Coding Hoodie", price: 50, size: "M"))
clothingCart.addItem(ClothingItem(name: "Debug Socks", price: 15, size: "One Size"))

// Print Naina's shopping carts
print("Naina's Tech Shopping Cart:")
for item in techCart.getAllItems() {
    print("\(item.name) - $\(item.price) (\(item.specs))")
}

print("\nNaina's Clothing Shopping Cart:")
for item in clothingCart.getAllItems() {
    print("\(item.name) - $\(item.price) (Size: \(item.size))")
}

// Calculate total spent
let techTotal = techCart.getTotalPrice()
let clothingTotal = clothingCart.getTotalPrice()
let grandTotal = techTotal + clothingTotal

print("\nTotal spent on tech: $\(techTotal)")
print("Total spent on clothing: $\(clothingTotal)")
print("Grand total: $\(grandTotal)")

/*:
Now, let's extend Naina's shopping system with two challenges that focus on generics.

## Challenge : Implement a Generic Inventory System
Create a generic Inventory class that can store and manage any type of Product. Include methods to add items, remove items, and check stock levels.
 
 **Test Data**
 
 // Create inventories
 let techInventory = Inventory<TechGadget>()
 let clothingInventory = Inventory<ClothingItem>()

 // Add items to tech inventory
 techInventory.addItem(TechGadget(name: "Laptop", price: 1200, specs: "16GB RAM, 512GB SSD"), quantity: 5)
 techInventory.addItem(TechGadget(name: "Smartphone", price: 800, specs: "6.1 inch, 128GB"), quantity: 10)

 // Add items to clothing inventory
 clothingInventory.addItem(ClothingItem(name: "T-Shirt", price: 20, size: "M"), quantity: 50)
 clothingInventory.addItem(ClothingItem(name: "Jeans", price: 60, size: "32"), quantity: 30)
 
*/

