//: [Previous](@previous)

/*:
# SpicySwift: The Great Indian Food Adventure 🌶️👨‍🍳

Welcome to the flavorful world of Indian cuisine! Karan has traveled to north tried different foods, and his taste buds are tingling with excitement. As he samples dishes from street vendors and local restaurants, he's inspired to create a fun food-themed game using Swift.

## Setting the Table with Types and Arrays

Karan starts by defining a type for food items and creating an array of Indian dishes:
*/

import Foundation

// Tuple type for food items
typealias FoodItem = (name: String, state: String, spiciness: Int)

// Array of Indian dishes
let indianDishes: [FoodItem] = [
    ("Butter Chicken", "Punjab", 2),
    ("Hyderabadi Biryani", "Telangana", 3),
    ("Dosa", "Tamil Nadu", 1),
    ("Vada Pav", "Maharashtra", 2),
    ("Rogan Josh", "Kashmir", 3),
    ("Rasgulla", "West Bengal", 0),
    ("Dhokla", "Gujarat", 1),
    ("Vegetable Vindaloo", "Goa", 4),
    ("Litti Chokha", "Bihar", 2),
    ("Macher Jhol", "West Bengal", 2)
]

/*:
## Game Variables

Karan sets up some variables to keep track of the player's progress:
*/

var spiceTolerance = 2
var dishesEaten = 0
let maxDishes = 5

/*:
## Helper Functions

He creates functions to display the player's status and simulate eating a dish:
*/

func displayStatus(tolerance: Int, dishes: Int) {
    print("\n🍽️ Dishes eaten: \(dishes)")
    print("🌶️ Spice tolerance: \(String(repeating: "🔥", count: tolerance))")
}

func eat(dish: FoodItem) -> Bool {
    if dish.spiciness <= spiceTolerance {
        print("Yum! You enjoyed the \(dish.name) from \(dish.state).")
        spiceTolerance += 1
        return true
    } else {
        print("Whoa! The \(dish.name) was too spicy for you!")
        spiceTolerance -= 1
        return false
    }
}

/*:
## Main Game Loop

Now, Karan implements the main game logic:
*/

print("Welcome to the Great Indian Food Adventure!")
print("Your goal is to taste as many dishes as you can without getting overwhelmed by spices.")
print("Your initial spice tolerance is \(spiceTolerance). It will increase as you eat more dishes.")

while dishesEaten < maxDishes && spiceTolerance > 0 {
    displayStatus(tolerance: spiceTolerance, dishes: dishesEaten)
    
    print("\nChoose a dish to try (1-\(indianDishes.count)):")
    for (index, dish) in indianDishes.enumerated() {
        print("\(index + 1). \(dish.name) from \(dish.state)")
    }
    
    let randomIndex = Int.random(in: 0..<indianDishes.count)
    let selectedDish = indianDishes[randomIndex]
    
    print("\nRandomly selected dish: \(randomIndex + 1). \(selectedDish.name)")
    
    if eat(dish: selectedDish) {
        dishesEaten += 1
    }
    
    if spiceTolerance == 0 {
        print("\n🥵 Oh no! Your spice tolerance dropped to zero. You need a glass of lassi!")
    }
}

/*:
## Game Result

After the game ends, Karan displays the final result:
*/

print("\n🎉 Food Adventure Complete! 🎉")
displayStatus(tolerance: spiceTolerance, dishes: dishesEaten)

switch dishesEaten {
case maxDishes:
    print("Congratulations! You're a true Indian food connoisseur!")
case 3...4:
    print("Great job! You've got a taste for Indian cuisine.")
case 1...2:
    print("Not bad! There's still so much more to explore in Indian cuisine.")
default:
    print("Don't worry! Indian cuisine has something for every palate. Try again!")
}

/*:
## Challenge Time! 🧠💪

Help Karan enhance his Great Indian Food Adventure game with these challenges:

1. Implement a scoring system based on the spiciness of dishes eaten.
2. Add a feature to "cool down" by drinking lassi, resetting spice tolerance.
3. Create a function that recommends dishes based on the current spice tolerance.
*/

// Write your solution here

// Implement a scoring system
func calculateScore(dish: FoodItem) -> Int {
    return dish.spiciness * 10
}

print("Scoring System")
print("Calculating score for Butter Chicken:")
print("Score: \(calculateScore(dish: indianDishes[0]))")
print("Calculating score for Vegetable Vindaloo:")
print("Score: \(calculateScore(dish: indianDishes[7]))")
print()


// Add a feature to "cool down" by drinking lassi
func drinkLassi() {
    print("\n🥛 Ahhh! You drink a cool lassi to reset your spice tolerance.")
    spiceTolerance = 2
}

print("Drink Lassi to Cool Down")
print("Current spice tolerance: \(spiceTolerance)")
spiceTolerance = 5 // Simulating increased spice tolerance
print("Spice tolerance after eating spicy food: \(spiceTolerance)")
drinkLassi()
print("Spice tolerance after drinking lassi: \(spiceTolerance)")
print()

// Create a function that recommends dishes based on the current spice tolerance
func recommendDish(tolerance: Int) -> FoodItem {
    var suitableDishes: [FoodItem] = []
    
    for dish in indianDishes {
        if dish.spiciness <= tolerance + 1 {
            suitableDishes.append(dish)
        }
    }
    
    if suitableDishes.isEmpty {
        return indianDishes[0]  // Return the first dish if no suitable dishes found
    } else {
        let randomIndex = Int.random(in: 0..<suitableDishes.count)
        return suitableDishes[randomIndex]
    }
}

print("Dish Recommendation")
print("Recommending a dish for spice tolerance 2:")
let recommendation1 = recommendDish(tolerance: 2)
print("Recommended: \(recommendation1.name) from \(recommendation1.state) (Spiciness: \(recommendation1.spiciness))")

print("\nRecommending a dish for spice tolerance 4:")
let recommendation2 = recommendDish(tolerance: 4)
print("Recommended: \(recommendation2.name) from \(recommendation2.state) (Spiciness: \(recommendation2.spiciness))")

// Additional test to show how it handles extreme cases
print("\nRecommending a dish for spice tolerance 0 (should return any dish):")
let recommendation3 = recommendDish(tolerance: 0)
print("Recommended: \(recommendation3.name) from \(recommendation3.state) (Spiciness: \(recommendation3.spiciness))")

/*:
Fantastic work! You've helped Karan create an exciting food adventure game while spicing up your Swift skills.

In our next chapter, we'll join Karan in Bangalore's tech hub, where we'll confront the ultimate coding nemesis: procrastination!

[Previous](@previous) | [Next](@next)
*/

//: [Next](@next)
